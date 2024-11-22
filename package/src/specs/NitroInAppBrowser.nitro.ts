import { type HybridObject } from 'react-native-nitro-modules'

export type NitroInAppBrowserDismissButtonLabel = 'cancel' | 'done' | 'close'

export enum NitroInAppBrowserPresentationStyle {
  PageSheet = 'pageSheet',
  FormSheet = 'formSheet',
}

export interface NitroInAppBrowserOptions {
  dismissButtonLabel?: NitroInAppBrowserDismissButtonLabel
  presentationStyle?: string // formSheet or pageSheet
  barColor?: string
  controlColor?: string
}

export interface NitroInAppBrowser
  extends HybridObject<{ ios: 'swift'; android: 'kotlin' }> {
  open(url: string, options?: NitroInAppBrowserOptions): void
  close(): void
}
