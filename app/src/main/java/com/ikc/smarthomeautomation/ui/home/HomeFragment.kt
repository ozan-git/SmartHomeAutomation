package com.ikc.smarthomeautomation.ui.home

import android.annotation.SuppressLint
import android.app.ProgressDialog
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothManager
import android.bluetooth.BluetoothSocket
import android.content.Context
import android.os.AsyncTask
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import com.ikc.smarthomeautomation.databinding.FragmentHomeBinding
import java.io.IOException
import java.util.*

class HomeFragment : Fragment() {

    private var _binding: FragmentHomeBinding? = null

    companion object {
        var mMyUUID: UUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB")
        var mBtSocket: BluetoothSocket? = null
        lateinit var mProgress: ProgressDialog
        lateinit var mBtAdapter: BluetoothAdapter
        var mIsConnected: Boolean = false
        lateinit var mAddress: String
    }

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentHomeBinding.inflate(inflater, container, false)

        val homeViewModel = ViewModelProvider(this)[HomeViewModel::class.java]
        mAddress = arguments?.getString("Device_address").toString()

        ConnectToDevice(requireContext()).execute()

        binding.toggleButton.setOnClickListener { sendCommand("a") }

        val textView: TextView = binding.textHome
        homeViewModel.text.observe(viewLifecycleOwner) {
            textView.text = it
        }
        return binding.root
    }

    private fun sendCommand(input: String) {
        if (mBtSocket != null) try {
            mBtSocket!!.outputStream.write(input.toByteArray())
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    private fun disconnect() {
        if (mBtSocket != null) {
            try {
                mBtSocket!!.close()
                mBtSocket = null
                mIsConnected = false
            } catch (e: IOException) {
                e.printStackTrace()
            }
        }
        requireActivity().finish()
    }

    private class ConnectToDevice(c: Context) : AsyncTask<Void, Void, String>() {
        private var connectSuccess: Boolean = true
        private val context: Context = c

        override fun onPreExecute() {
            super.onPreExecute()
            mProgress = ProgressDialog.show(context, "Connecting...", "please wait")
        }

        @SuppressLint("MissingPermission")
        override fun doInBackground(vararg p0: Void?): String {
            try {
                val bluetoothManager =
                    context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
                if (mBtSocket == null || !mIsConnected) {
                    mBtAdapter = bluetoothManager.adapter

                    val device: BluetoothDevice = mBtAdapter.getRemoteDevice(mAddress)

                    mBtSocket = device.createInsecureRfcommSocketToServiceRecord(mMyUUID)
                    bluetoothManager.adapter.cancelDiscovery()
                    mBtSocket!!.connect()
                }
            } catch (e: IOException) {
                connectSuccess = false
                e.printStackTrace()
            }
            return null.toString()
        }

        override fun onPostExecute(result: String?) {
            super.onPostExecute(result)
            if (!connectSuccess) {
                Log.i("data", "couldn't connect")
            } else {
                mIsConnected = true
            }
            mProgress.dismiss()
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}