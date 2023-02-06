package com.example.flutter_example

import android.util.Base64
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.flutter.dev/info";
    private val CHANNEL2 = "com.flutter.dev/encrypt";

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->  if(call.method == "getDeviceInfo"){
            val deviceInfo = getDeviceInfo()
            result.success(deviceInfo)
        } }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL2).setMethodCallHandler { call, result ->  if(call.method == "getEncrypt"){
            val data = call.arguments.toString().toByteArray()
            val changeText = Base64.encodeToString(data, Base64.DEFAULT)
            result.success(changeText)
        } }
    }

    private fun getDeviceInfo():String {
        val sb = StringBuffer()
        sb.append(Build.DEVICE + "\n")
        sb.append(Build.BOARD + "\n")
        sb.append(Build.MODEL + "\n")
        return sb.toString()

    }
    
}
