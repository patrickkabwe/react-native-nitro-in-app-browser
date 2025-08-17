export type NitroInAppBrowserDismissButtonLabel = 'cancel' | 'done' | 'close'

export type NitroInAppBrowserPresentationStyle = 'pageSheet' | 'formSheet' | 'fullScreen'

export interface NitroInAppBrowserOptions {
    dismissButtonLabel?: NitroInAppBrowserDismissButtonLabel
    presentationStyle?: NitroInAppBrowserPresentationStyle
    barColor?: string
    controlColor?: string
}
