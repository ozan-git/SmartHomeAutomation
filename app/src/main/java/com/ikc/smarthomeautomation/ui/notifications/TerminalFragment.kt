package com.ikc.smarthomeautomation.ui.notifications

import android.app.Activity
import android.app.AlertDialog
import android.bluetooth.BluetoothAdapter
import android.content.*
import android.os.Bundle
import android.os.IBinder
import android.text.Spannable
import android.text.SpannableStringBuilder
import android.text.method.ScrollingMovementMethod
import android.text.style.ForegroundColorSpan
import android.view.*
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import com.ikc.smarthomeautomation.R
import com.ikc.smarthomeautomation.databinding.FragmentTerminalBinding
import com.ikc.smarthomeautomation.network.SerialListener
import com.ikc.smarthomeautomation.network.SerialService
import com.ikc.smarthomeautomation.network.SerialService.SerialBinder
import com.ikc.smarthomeautomation.network.SerialSocket
import com.ikc.smarthomeautomation.ui.SharedViewModel
import com.ikc.smarthomeautomation.utils.TextUtil
import com.ikc.smarthomeautomation.utils.TextUtil.HexWatcher

class TerminalFragment : Fragment(), ServiceConnection, SerialListener {

    private var _binding: FragmentTerminalBinding? = null
    private val binding get() = _binding!!

    private var hexWatcher: HexWatcher? = null
    private var connected = Connected.False
    private var initialStart = true
    private var hexEnabled = false
    private var pendingNewline = false
    private var newline: String = TextUtil.newline_crlf
    private val sharedViewModel: SharedViewModel by activityViewModels()

    /**
     * Lifecycle
     */
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setHasOptionsMenu(true)
        retainInstance = true
    }

    override fun onDestroy() {
        if (connected != Connected.False) disconnect()
        requireActivity().stopService(Intent(activity, SerialService::class.java))
        super.onDestroy()
    }

    override fun onStart() {
        super.onStart()
        if (sharedViewModel.service != null)
            sharedViewModel.service!!.attach(this)
        else
            requireActivity().startService(Intent(activity, SerialService::class.java))
        // prevents service destroy on unbind from recreated activity caused by orientation change
    }

//    override fun onStop() {
//        if (service != null && !requireActivity().isChangingConfigurations)
//            service!!.detach()
//        super.onStop()
//    }

    @Deprecated("Deprecated in Java")
    override fun onAttach(activity: Activity) {
        super.onAttach(activity)
        requireActivity().bindService(Intent(requireActivity(), SerialService::class.java), this, Context.BIND_AUTO_CREATE)
    }

    override fun onDetach() {
        try {
            requireActivity().unbindService(this)
        } catch (ignored: Exception) {
        }
        super.onDetach()
    }

    override fun onResume() {
        super.onResume()
        if (initialStart && sharedViewModel.service != null) {
            initialStart = false
            requireActivity().runOnUiThread { connect() }
        }
    }

    override fun onServiceConnected(name: ComponentName, binder: IBinder) {
        sharedViewModel.service = (binder as SerialBinder).service
        sharedViewModel.service!!.attach(this)
        if (initialStart && isResumed) {
            initialStart = false
            requireActivity().runOnUiThread { connect() }
        }
    }

    override fun onServiceDisconnected(name: ComponentName) {
        sharedViewModel.service = null
    }

    /*
     * UI
     */
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentTerminalBinding.inflate(inflater, container, false)

        val view = binding.root
        binding.receiveText.setTextColor(resources.getColor(R.color.colorRecieveText)) // set as default color to reduce number of spans
        binding.receiveText.movementMethod = ScrollingMovementMethod.getInstance()
        hexWatcher = HexWatcher(binding.sendText)
        hexWatcher!!.enable(hexEnabled)
        binding.sendText.addTextChangedListener(hexWatcher)
        binding.sendText.hint = if (hexEnabled) "HEX mode" else ""
        binding.sendBtn.setOnClickListener {
            send(binding.sendText.text.toString())
        }
        return view
    }

    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        inflater.inflate(R.menu.menu_terminal, menu)
        menu.findItem(R.id.hex).isChecked = hexEnabled
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            R.id.clear -> {
                binding.receiveText.text = ""
                true
            }
            R.id.newline -> {
                val newlineNames = resources.getStringArray(R.array.newline_names)
                val newlineValues = resources.getStringArray(R.array.newline_values)
                val pos = mutableListOf(*newlineValues).indexOf(newline)
                val builder = AlertDialog.Builder(
                    activity
                )
                builder.setTitle("Newline")
                builder.setSingleChoiceItems(
                    newlineNames,
                    pos
                ) { dialog: DialogInterface, item1: Int ->
                    newline = newlineValues[item1]
                    dialog.dismiss()
                }
                builder.create().show()
                true
            }
            R.id.hex -> {
                hexEnabled = !hexEnabled
                binding.sendText.text = null
                hexWatcher!!.enable(hexEnabled)
                binding.sendText.hint = if (hexEnabled) "HEX mode" else ""
                item.isChecked = hexEnabled
                true
            }
            else -> {
                super.onOptionsItemSelected(item)
            }
        }
    }

    /**
     * Serial + UI
     */
    private fun connect() {
        try {
            val bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
            val device = bluetoothAdapter.getRemoteDevice(sharedViewModel.deviceAddress)
            status("connecting...")
            connected = Connected.Pending
            val socket = SerialSocket(requireActivity().applicationContext, device)
            sharedViewModel.service!!.connect(socket)
        } catch (e: Exception) {
            onSerialConnectError(e)
        }
    }

    private fun disconnect() {
        connected = Connected.False
        sharedViewModel.service!!.disconnect()
    }

    private fun send(str: String) {
        if (connected != Connected.True) {
            Toast.makeText(activity, "not connected", Toast.LENGTH_SHORT).show()
            return
        }
        try {
            val msg: String
            val data: ByteArray
            if (hexEnabled) {
                val sb = StringBuilder()
                TextUtil.toHexString(sb, TextUtil.fromHexString(str))
                TextUtil.toHexString(sb, newline.toByteArray())
                msg = sb.toString()
                data = TextUtil.fromHexString(msg)
            } else {
                msg = str
                data = (str + newline).toByteArray()
            }
            val spn = SpannableStringBuilder(msg.trimIndent())
            spn.setSpan(
                ForegroundColorSpan(resources.getColor(R.color.colorSendText)),
                0,
                spn.length,
                Spannable.SPAN_EXCLUSIVE_EXCLUSIVE
            )
            binding.receiveText.append(spn)
            sharedViewModel.service!!.write(data)
        } catch (e: Exception) {
            onSerialIoError(e)
        }
    }

    private fun receive(data: ByteArray) {
        if (hexEnabled) {
            binding.receiveText.append(TextUtil.toHexString(data) + '\n')
        } else {
            var msg = String(data)
            if (newline == TextUtil.newline_crlf && msg.isNotEmpty()) {
                // don't show CR as ^M if directly before LF
                msg = msg.replace(TextUtil.newline_crlf, TextUtil.newline_lf)
                // special handling if CR and LF come in separate fragments
                if (pendingNewline && msg[0] == '\n') {
                    val edt = binding.receiveText.editableText
                    if (edt != null && edt.length > 1) edt.replace(edt.length - 2, edt.length, "")
                }
                pendingNewline = msg[msg.length - 1] == '\r'
            }
            binding.receiveText.append(TextUtil.toCaretString(msg, newline.isNotEmpty()))
        }
    }

    private fun status(str: String) {
        val spn = SpannableStringBuilder(str.trimIndent())
        spn.setSpan(
            ForegroundColorSpan(resources.getColor(R.color.colorStatusText)),
            0,
            spn.length,
            Spannable.SPAN_EXCLUSIVE_EXCLUSIVE
        )
        binding.receiveText.append(spn)
    }

    /*
     * SerialListener
     */
    override fun onSerialConnect() {
        status("connected")
        connected = Connected.True
    }

    override fun onSerialConnectError(e: Exception?) {
        status("connection failed: " + e!!.message)
        disconnect()
    }

    override fun onSerialRead(data: ByteArray?) {
        receive(data!!)
    }

    override fun onSerialIoError(e: Exception?) {
        status("connection lost: " + e!!.message)
        disconnect()
    }

    private enum class Connected {
        False, Pending, True
    }
}