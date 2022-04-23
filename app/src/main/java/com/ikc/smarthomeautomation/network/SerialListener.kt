package com.ikc.smarthomeautomation.network

interface SerialListener {
    fun onSerialConnect()

    fun onSerialConnectError(e: Exception?)

    fun onSerialRead(data: ByteArray?)

    fun onSerialIoError(e: Exception?)
}