export type NitroInAppBrowserDismissButtonLabel = 'cancel' | 'done' | 'close'

export enum NitroInAppBrowserPresentationStyle {
  PageSheet = 'pageSheet',
  FormSheet = 'formSheet',
  FullScreen = 'fullScreen',
}

export interface NitroInAppBrowserOptions {
  dismissButtonLabel?: NitroInAppBrowserDismissButtonLabel
  presentationStyle?: string // NitroInAppBrowserPresentationStyle
  barColor?: string
  controlColor?: string
}
