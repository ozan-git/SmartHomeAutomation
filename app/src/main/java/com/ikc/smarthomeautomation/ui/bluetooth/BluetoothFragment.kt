package com.ikc.smarthomeautomation.ui.bluetooth

import android.R.layout.simple_list_item_1
import android.annotation.SuppressLint
import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import android.view.*
import android.widget.AdapterView.OnItemClickListener
import android.widget.ArrayAdapter
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import androidx.navigation.fragment.findNavController
import com.ikc.smarthomeautomation.R
import com.ikc.smarthomeautomation.databinding.FragmentBluetoothBinding
import com.ikc.smarthomeautomation.ui.SharedViewModel

class BluetoothFragment : Fragment() {

    private var _binding: FragmentBluetoothBinding? = null
    private val binding get() = _binding!!

    private var bluetoothAdapter: BluetoothAdapter? = null
    private lateinit var mPairedDevices: Set<BluetoothDevice>
    private val sharedViewModel: SharedViewModel by activityViewModels()


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setHasOptionsMenu(true)
        setBluetoothAdapter()
    }

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentBluetoothBinding.inflate(inflater, container, false)
        binding.refreshButton.setOnClickListener { pairedDeviceList() }
        return binding.root
    }

    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        inflater.inflate(R.menu.menu_devices, menu)
        if (bluetoothAdapter == null) menu.findItem(R.id.bt_settings).isEnabled = false
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        val id = item.itemId
        return if (id == R.id.bt_settings) {
            val intent = Intent()
            intent.action = Settings.ACTION_BLUETOOTH_SETTINGS
            startActivity(intent)
            true
        } else super.onOptionsItemSelected(item)
    }

    @SuppressLint("MissingPermission")
    private fun pairedDeviceList() {
        mPairedDevices = bluetoothAdapter!!.bondedDevices
        val list: ArrayList<BluetoothDevice> = ArrayList()

        if (mPairedDevices.isEmpty()) toast("No paired bluetooth device found.")
        else for (device: BluetoothDevice in mPairedDevices) list.add(device)

        val adapter = ArrayAdapter(requireContext(), simple_list_item_1, list)

        binding.deviceList.adapter = adapter
        binding.deviceList.onItemClickListener = OnItemClickListener { _, _, position, _ ->
            val device: BluetoothDevice = list[position]
            val bundle = Bundle()
            bundle.putString("device", device.address)
            sharedViewModel.deviceAddress = device.address
            findNavController().navigate(R.id.action_bluetoothFragment_to_navigation_home, bundle)
        }
        return
    }

    @Deprecated("Deprecated in Java")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 1) {
            when (resultCode) {
                Activity.RESULT_OK -> when {
                    bluetoothAdapter!!.isEnabled -> toast("Bluetooth has been enabled.")
                    else -> toast("Bluetooth has been disabled.")
                }
                Activity.RESULT_CANCELED -> toast("Bluetooth enabling has been canceled.")
            }
        }
    }

    private fun setBluetoothAdapter() {
        val bluetoothManager =
            requireActivity().getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
        bluetoothAdapter = bluetoothManager.adapter

        if (bluetoothAdapter == null) {
            toast("This device does not support bluetooth.")
            return
        }

        if (!bluetoothAdapter!!.isEnabled) {
            val enableBluetoothIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
            startActivityForResult(enableBluetoothIntent, 1)
        }
    }

    private fun toast(text: String) {
        Toast.makeText(requireContext(), text, Toast.LENGTH_SHORT).show()
    }
}