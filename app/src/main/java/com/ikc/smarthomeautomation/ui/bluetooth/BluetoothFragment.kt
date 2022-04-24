package com.ikc.smarthomeautomation.ui.bluetooth

import android.annotation.SuppressLint
import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import android.util.Log
import android.view.*
import android.widget.*
import androidx.annotation.RequiresApi
import androidx.fragment.app.Fragment
import androidx.fragment.app.ListFragment
import androidx.fragment.app.activityViewModels
import androidx.lifecycle.ViewModelProvider
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

        if (requireActivity().packageManager.hasSystemFeature(PackageManager.FEATURE_BLUETOOTH))
            bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()

        val bluetoothManager =
            requireActivity().getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
        bluetoothAdapter = bluetoothManager.adapter

        if (bluetoothAdapter == null) {
            Toast.makeText(
                requireContext(),
                "This device does not support bluetooth.",
                Toast.LENGTH_SHORT
            ).show()
            return
        }
        if (!bluetoothAdapter!!.isEnabled) {
            val enableBluetoothIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
            startActivityForResult(enableBluetoothIntent, 1)
        }
    }

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        val bluetoothViewModel = ViewModelProvider(this)[BluetoothViewModel::class.java]
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
        } else {
            super.onOptionsItemSelected(item)
        }
    }

    @SuppressLint("MissingPermission")
    @RequiresApi(Build.VERSION_CODES.M)
    private fun pairedDeviceList() {
        mPairedDevices = bluetoothAdapter!!.bondedDevices
        val list: ArrayList<BluetoothDevice> = ArrayList()

        if (mPairedDevices.isNotEmpty()) {
            for (device: BluetoothDevice in mPairedDevices) {
                list.add(device)
                Log.i("Device", "" + device)
            }
        } else {
            Toast.makeText(context, "No paired bluetooth device found.", Toast.LENGTH_SHORT).show()
        }
        val adapter = ArrayAdapter(requireContext(), android.R.layout.simple_list_item_1, list)
        binding.deviceList.adapter = adapter
        binding.deviceList.onItemClickListener =
            AdapterView.OnItemClickListener { _, _, position, _ ->
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
                Activity.RESULT_CANCELED ->
                    toast("Bluetooth enabling has been canceled.")
            }
        }
    }

    private fun toast(text: String) {
        Toast.makeText(requireContext(), text, Toast.LENGTH_SHORT).show()
    }

}