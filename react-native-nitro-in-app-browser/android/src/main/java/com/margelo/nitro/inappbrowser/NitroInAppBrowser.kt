package com.margelo.nitro.inappbrowser

import com.margelo.nitro.NitroModules


class NitroInAppBrowser: HybridNitroInAppBrowserSpec() {
    override val memorySize: Long
        get() = 5

    private val inAppBrowser = NitroInAppBrowserImpl(NitroModules.applicationContext)

    override fun open(url: String, options: NitroInAppBrowserOptions?) {
        inAppBrowser.open(url, options)
    }

    override fun close() {
        inAppBrowser.close()
    }
}