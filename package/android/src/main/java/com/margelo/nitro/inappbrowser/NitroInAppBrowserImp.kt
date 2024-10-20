package com.margelo.nitro.inappbrowser

import android.content.pm.PackageManager
import android.net.Uri
import android.util.Log
import androidx.browser.customtabs.CustomTabColorSchemeParams
import androidx.browser.customtabs.CustomTabsIntent
import com.facebook.react.bridge.ReactApplicationContext

class NitroInAppBrowserImp(private val reactContext: ReactApplicationContext?) {

    fun open(url: String, options: NitroInAppBrowserOptions?){
        val customTabParams  = CustomTabColorSchemeParams.Builder()
        if (options?.barColor != null){
            customTabParams.setToolbarColor(getColor(options.barColor))
        }

        val customTabIntent = CustomTabsIntent.Builder()
        customTabIntent.setShowTitle(false)
        customTabIntent.setInstantAppsEnabled(false)
        customTabIntent.setDefaultColorSchemeParams(customTabParams.build())
        customTabIntent.setShareState(CustomTabsIntent.SHARE_STATE_ON)

        val intent = customTabIntent.build()
        intent.apply {
            if (!isPackageInstalled("com.android.chrome")){
                Log.d(TAG, "Chrome not installed")
            } else {
                intent.intent.setPackage("com.android.chrome")
            }
        }
        val currentActivity = reactContext?.currentActivity ?: return
        intent.launchUrl(currentActivity, Uri.parse(url))
    }

    fun close(){
        Log.d(TAG,"Closing Browser")
        reactContext?.currentActivity?.finish()
    }

    private fun getColor(color: String): Int{
        return try {
            android.graphics.Color.parseColor(color)
        }  catch (e: IllegalArgumentException){
            android.graphics.Color.parseColor("#ffffff")
        }
    }

    private fun isPackageInstalled(packageName: String): Boolean {
        return try {
            reactContext?.packageManager?.getPackageInfo(packageName, 0)
            true
        } catch (e: PackageManager.NameNotFoundException) {
            Log.d(TAG, "Package not found")
            false
        }
    }

    companion object {
        const val TAG = "NitroInAppBrowser"
    }
}