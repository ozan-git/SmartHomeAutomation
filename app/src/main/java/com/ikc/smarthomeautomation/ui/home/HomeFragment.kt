package com.ikc.smarthomeautomation.ui.home

import android.app.ProgressDialog
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothSocket
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ProgressBar
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.navigation.fragment.navArgs
import com.ikc.smarthomeautomation.databinding.FragmentHomeBinding
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
        val homeViewModel = ViewModelProvider(this)[HomeViewModel::class.java]
        mAddress = arguments?.getString("Device_address").toString()
        _binding = FragmentHomeBinding.inflate(inflater, container, false)

        val textView: TextView = binding.textHome
        homeViewModel.text.observe(viewLifecycleOwner) {
            textView.text = it
        }
        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}