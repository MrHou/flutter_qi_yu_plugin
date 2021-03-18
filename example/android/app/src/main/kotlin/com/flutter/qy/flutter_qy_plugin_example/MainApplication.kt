package com.flutter.qy.flutter_qy_plugin_example

import com.flutter.qy.flutter_qy_plugin.FlutterQyPlugin
import io.flutter.app.FlutterApplication

class MainApplication : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        val activity = MainActivity::class.java
        FlutterQyPlugin.initSDK(this,"595445914922b38dd5c313ab2011be39",activity)

    }

}