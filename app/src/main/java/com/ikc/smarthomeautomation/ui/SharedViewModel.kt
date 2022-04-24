package com.ikc.smarthomeautomation.ui

import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.ViewModel
import com.ikc.smarthomeautomation.network.SerialService

class SharedViewModel : ViewModel(), LifecycleObserver {
    var deviceAddress: String? = null
    var service: SerialService? = null

}