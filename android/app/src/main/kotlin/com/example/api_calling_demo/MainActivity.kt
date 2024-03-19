package com.example.api_calling_demo

import android.provider.Settings.Secure
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

private const val kChannel = "app"
private const val kMethodFlavor = "getFlavor"
private const val kMethodDeviceId = "getDeviceID"

class MainActivity: FlutterActivity() {
     override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        // Use the GeneratedPluginRegistrant to add every plugin that's in the pubspec.
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, kChannel).setMethodCallHandler {
            call, result ->
            if (call.method.equals(kMethodFlavor)) {
                result.success(BuildConfig.FLAVOR)
            } else if (call.method.equals(kMethodDeviceId)) {
                val android_id = Secure.getString(context.contentResolver,
                        Secure.ANDROID_ID)
                result.success(android_id)
            }
        }
    }
}
