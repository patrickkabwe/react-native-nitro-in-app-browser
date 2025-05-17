package com.nitroinappbrowser

import com.margelo.nitro.NitroModules
import com.margelo.nitro.core.Promise
import com.margelo.nitro.nitroinappbrowser.HybridNitroInAppBrowserSpec
import com.margelo.nitro.nitroinappbrowser.NitroInAppBrowserOptions
import kotlinx.coroutines.MainScope

class HybridNitroInAppBrowser: HybridNitroInAppBrowserSpec() {
    private val inAppBrowser = NitroInAppBrowserImpl(NitroModules.applicationContext)
    private val scope = MainScope()

    override fun open(url: String, options: NitroInAppBrowserOptions?): Promise<Unit> {
        return Promise.async(scope) {
            inAppBrowser.open(url, options)
        }
    }

    override fun close(): Promise<Unit> {
        return Promise.async(scope) {
            inAppBrowser.close()
        }
    }
}
