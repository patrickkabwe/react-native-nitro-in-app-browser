export * from './specs/NitroInAppBrowser.nitro'
import { NitroModules } from 'react-native-nitro-modules'
import type { NitroInAppBrowser as RNNitroInAppBrowserSpec } from './specs/NitroInAppBrowser.nitro'

export const NitroInAppBrowser =
  NitroModules.createHybridObject<RNNitroInAppBrowserSpec>('NitroInAppBrowser')
