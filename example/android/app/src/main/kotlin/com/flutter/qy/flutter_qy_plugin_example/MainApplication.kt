package com.flutter.qy.flutter_qy_plugin_example

import com.flutter.qy.flutter_qy_plugin.FlutterQyPlugin
import io.flutter.app.FlutterApplication

class MainApplication : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        val activity = MainActivity::class.java
        FlutterQyPlugin.initSDK(this,"063da122b2c0a592a70556647540efd5",activity)

    }

}