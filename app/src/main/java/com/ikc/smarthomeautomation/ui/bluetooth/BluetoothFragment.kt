package com.ikc.smarthomeautomation.ui.bluetooth

import android.annotation.SuppressLint
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Bundle
import android.provider.Settings
import android.view.*
import android.widget.ArrayAdapter
import android.widget.ListView
import android.widget.TextView
import androidx.fragment.app.ListFragment
import androidx.navigation.fragment.findNavController
import com.ikc.smarthomeautomation.R
import com.ikc.smarthomeautomation.databinding.FragmentBluetoothBinding

class BluetoothFragment : ListFragment() {


    companion object {
        fun newInstance() = BluetoothFragment()
    }

    private var bluetoothAdapter: BluetoothAdapter? = null
    private val listItems = ArrayList<BluetoothDevice>()
    private var listAdapter: ArrayAdapter<BluetoothDevice>? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setHasOptionsMenu(true)

        if (requireActivity().packageManager.hasSystemFeature(PackageManager.FEATURE_BLUETOOTH))
            bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        listAdapter = BluetoothFragment
        listAdapter = object : ArrayAdapter<BluetoothDevice>(requireContext(), 0, listItems) {
            override fun getView(position: Int, view: View?, parent: ViewGroup): View {
                val device = listItems[position]

                val deviceName = view!!.findViewById<TextView>(R.id.deviceNameTV)
                val deviceAddress = view.findViewById<TextView>(R.id.deviceAddressTV)
                @SuppressLint("MissingPermission")
                deviceName.text = device.name
                deviceAddress.text = device.address
                return view
            }
        }
    }

    @Deprecated("Deprecated in Java")
    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        setListAdapter(null)
        val header =
            requireActivity().layoutInflater.inflate(R.layout.device_list_header, null, false)
        listView.addHeaderView(header, null, false)
        setEmptyText("initializing...")
        (listView.emptyView as TextView).textSize = 18f
        setListAdapter(listAdapter)
    }

    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        inflater.inflate(R.menu.menu_devices, menu)
        if (bluetoothAdapter == null) menu.findItem(R.id.bt_settings).isEnabled = false
    }

    override fun onResume() {
        super.onResume()
        if (bluetoothAdapter == null) setEmptyText("<bluetooth not supported>") else if (!bluetoothAdapter!!.isEnabled) setEmptyText(
            "<bluetooth is disabled>"
        ) else setEmptyText("<no bluetooth devices found>")
        refresh()
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
    fun refresh() {
        listItems.clear()
        if (bluetoothAdapter != null) {
            for (device in bluetoothAdapter!!.bondedDevices)
                if (device.type != BluetoothDevice.DEVICE_TYPE_LE) listItems.add(device)
        }

        listItems.sortWith { a: BluetoothDevice?, b: BluetoothDevice? ->
            compareTo(a!!, b!!)
        }

        listAdapter!!.notifyDataSetChanged()
    }

    override fun onListItemClick(l: ListView, v: View, position: Int, id: Long) {
        val device = listItems[position - 1]
        val bundle = Bundle()
        bundle.putString("device", device.address)
        findNavController().navigate(R.id.action_bluetoothFragment_to_navigation_home, bundle)
    }

    /**
     * sort by name, then address. sort named devices first
     */
    @SuppressLint("MissingPermission")
    fun compareTo(a: BluetoothDevice, b: BluetoothDevice): Int {
        val aValid = a.name != null && a.name.isNotEmpty()
        val bValid = b.name != null && b.name.isNotEmpty()
        if (aValid && bValid) {
            val ret = a.name.compareTo(b.name)
            return if (ret != 0) ret else a.address.compareTo(b.address)
        }
        if (aValid) return -1
        return if (bValid) +1 else a.address.compareTo(b.address)
    }

}