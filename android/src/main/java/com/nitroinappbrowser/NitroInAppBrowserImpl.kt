package com.nitroinappbrowser

import android.content.pm.PackageManager
import android.net.Uri
import android.util.Log
import androidx.browser.customtabs.CustomTabColorSchemeParams
import androidx.browser.customtabs.CustomTabsIntent
import com.facebook.react.bridge.ReactApplicationContext
import com.margelo.nitro.core.Promise
import com.margelo.nitro.nitroinappbrowser.NitroInAppBrowserOptions
import com.margelo.nitro.nitroinappbrowser.NitroInAppBrowserPresentationStyle
import androidx.core.graphics.toColorInt
import androidx.core.net.toUri


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

        val currentActivity = reactContext?.currentActivity ?: throw Error("No Activity")

        val customTabIntent = CustomTabsIntent.Builder()
        customTabIntent.setShowTitle(false)
        customTabIntent.setInstantAppsEnabled(false)
        customTabIntent.setDefaultColorSchemeParams(customTabParams.build())
        customTabIntent.setShareState(CustomTabsIntent.SHARE_STATE_ON)

        // pageSheet/formSheet -> partial custom tab (bottom sheet), like iOS;
        // fullScreen/unset stay full-screen. Height = display minus a fixed top-gap
        // peek; Chrome clamps the minimum to 50% and the user can drag to full.
        when (options?.presentationStyle) {
            NitroInAppBrowserPresentationStyle.PAGESHEET,
            NitroInAppBrowserPresentationStyle.FORMSHEET -> {
                val metrics = currentActivity.resources.displayMetrics
                val topGapPx = (TOP_GAP_DP * metrics.density).toInt()
                customTabIntent.setInitialActivityHeightPx(
                    metrics.heightPixels - topGapPx,
                    CustomTabsIntent.ACTIVITY_HEIGHT_ADJUSTABLE,
                )
                customTabIntent.setToolbarCornerRadiusDp(TOOLBAR_CORNER_RADIUS_DP)
            }
            else -> Unit
        }

        val intent = customTabIntent.build()
        if (!isPackageInstalled()) {
            Log.d(TAG, "Chrome not installed")
        } else {
            intent.intent.setPackage(chromePackageName)
        }
        // Partial tabs are only honored when launched via startActivityForResult
        // (or a CustomTabsSession); launchUrl() silently ignores the height.
        intent.intent.data = url.toUri()
        currentActivity.startActivityForResult(
            intent.intent,
            IN_APP_BROWSER_REQUEST_CODE,
            intent.startAnimationBundle,
        )
        return Promise.resolved(Unit)
    }

    fun close(){
        Log.d(TAG,"Closing Browser")
        reactContext?.currentActivity?.finish()
    }

    private fun getColor(color: String): Int{
        return try {
            color.toColorInt()
        }  catch (e: IllegalArgumentException){
            "#ffffff".toColorInt()
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
        const val TAG = "NitroInAppBrowserImpl"
        // Fixed top peek (dp) subtracted from the display height for the sheet's
        // initial height — a constant gap across screen sizes, like iOS pageSheet.
        private const val TOP_GAP_DP = 80f
        // Arbitrary request code: startActivityForResult is required for Chrome to
        // honor the partial-tab height; we don't consume the result.
        private const val IN_APP_BROWSER_REQUEST_CODE = 0x1A0B
        // System clamps the toolbar corner radius at 16dp.
        private const val TOOLBAR_CORNER_RADIUS_DP = 16
    }
}