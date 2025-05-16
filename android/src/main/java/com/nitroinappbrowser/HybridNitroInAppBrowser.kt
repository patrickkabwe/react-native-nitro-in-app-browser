package com.nitroinappbrowser

import com.margelo.nitro.NitroModules
import com.margelo.nitro.core.Promise
import com.margelo.nitro.nitroinappbrowser.HybridNitroInAppBrowserSpec
import com.margelo.nitro.nitroinappbrowser.NitroInAppBrowserOptions

class HybridNitroInAppBrowser: HybridNitroInAppBrowserSpec() {
    private val inAppBrowser = NitroInAppBrowserImpl(NitroModules.applicationContext)

    override fun open(url: String, options: NitroInAppBrowserOptions?): Promise<Unit> {
        return Promise.async {
            inAppBrowser.open(url, options)
        }
    }

    override fun close() {
        inAppBrowser.close()
    }
}
