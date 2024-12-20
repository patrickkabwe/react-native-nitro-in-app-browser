package com.margelo.nitro.inappbrowser

import android.content.pm.PackageManager
import android.net.Uri
import android.util.Log
import androidx.browser.customtabs.CustomTabColorSchemeParams
import androidx.browser.customtabs.CustomTabsIntent
import com.facebook.react.bridge.ReactApplicationContext
import com.margelo.nitro.core.Promise

class NitroInAppBrowserImpl(private val reactContext: ReactApplicationContext?) {

    private val chromePackageName = "com.android.chrome"

    fun open(url: String, options: NitroInAppBrowserOptions?): Promise<Unit> {
        if (url.isEmpty()){
            Log.d(TAG, "Empty URL")
            throw Error("Empty URL")
        }
        if (!url.startsWith("http://") && !url.startsWith("https://")){
            Log.d(TAG, "Invalid URL")
            throw Error("Invalid URL")
        }

        val customTabParams  = CustomTabColorSchemeParams.Builder()
        if (options?.barColor != null){
            customTabParams.setToolbarColor(getColor(options.barColor))
            customTabParams.setSecondaryToolbarColor(getColor(options.barColor))
            customTabParams.setNavigationBarColor(getColor(options.barColor))
        }

        val customTabIntent = CustomTabsIntent.Builder()
        customTabIntent.setShowTitle(false)
        customTabIntent.setInstantAppsEnabled(false)
        customTabIntent.setDefaultColorSchemeParams(customTabParams.build())
        customTabIntent.setShareState(CustomTabsIntent.SHARE_STATE_ON)

        val intent = customTabIntent.build()
        intent.apply {
            if (!isPackageInstalled()){
                Log.d(TAG, "Chrome not installed")
            } else {
                intent.intent.setPackage(chromePackageName)
            }
        }
        val currentActivity = reactContext?.currentActivity ?: throw Error("No Activity")
        intent.launchUrl(currentActivity, Uri.parse(url))
        return Promise.resolved(Unit)
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

    private fun isPackageInstalled(): Boolean {
        return try {
            reactContext?.packageManager?.getPackageInfo(chromePackageName, 0)
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }

    companion object {
        const val TAG = "NitroInAppBrowser"
    }
}