package com.ikc.smarthomeautomation.ui.bluetooth

import android.annotation.SuppressLint
import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.navigation.fragment.findNavController
import com.ikc.smarthomeautomation.R
import com.ikc.smarthomeautomation.databinding.FragmentBluetoothBinding

class BluetoothFragment : Fragment() {

    private var _binding: FragmentBluetoothBinding? = null
    private val binding get() = _binding!!

    private var mBtAdapter: BluetoothAdapter? = null
    private lateinit var mPairedDevices: Set<BluetoothDevice>

    companion object {
        const val EXTRA_ADDRESS: String = "Device_address"
        const val REQUEST_ENABLE_BLUETOOTH = 1
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val bluetoothManager =
            requireActivity().getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
        mBtAdapter = bluetoothManager.adapter

        if (mBtAdapter == null) {
            Toast.makeText(
                requireContext(),
                "This device does not support bluetooth.",
                Toast.LENGTH_SHORT
            ).show()
            return
        }
        if (!mBtAdapter!!.isEnabled) {
            val enableBluetoothIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
            startActivityForResult(enableBluetoothIntent, REQUEST_ENABLE_BLUETOOTH)
        }
    }

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        val bluetoothViewModel = ViewModelProvider(this)[BluetoothViewModel::class.java]
        _binding = FragmentBluetoothBinding.inflate(inflater, container, false)
        binding.refreshButton.setOnClickListener { pairedDeviceList() }
        return binding.root
    }


    @SuppressLint("MissingPermission")
    @RequiresApi(Build.VERSION_CODES.M)
    private fun pairedDeviceList() {
        mPairedDevices = mBtAdapter!!.bondedDevices
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
                val address: String = device.address

                val bundle = Bundle()
                bundle.putString(EXTRA_ADDRESS, address)
                findNavController().navigate(
                    R.id.action_bluetoothFragment_to_navigation_home,
                    bundle
                )
            }
        return
    }

    @Deprecated("Deprecated in Java")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQUEST_ENABLE_BLUETOOTH) {
            when (resultCode) {
                Activity.RESULT_OK -> when {
                    mBtAdapter!!.isEnabled -> toast("Bluetooth has been enabled.")
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