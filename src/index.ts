import { NitroModules } from 'react-native-nitro-modules'
import type { NitroInAppBrowser as NitroInAppBrowserSpec } from './specs/nitro-in-app-browser.nitro'
import type { NitroInAppBrowserOptions, NitroInAppBrowserPresentationStyle } from "./types"
export * from "./types"

const NitroInAppBrowserModule =
    NitroModules.createHybridObject<NitroInAppBrowserSpec>('NitroInAppBrowser')

const NitroInAppBrowser = {
    open: (url: string, options?: Omit<NitroInAppBrowserOptions, 'presentationStyle'> & {
        presentationStyle?: NitroInAppBrowserPresentationStyle
    }) =>
        NitroInAppBrowserModule.open(url, options),
    close: () => NitroInAppBrowserModule.close(),
}

export default NitroInAppBrowser