import { type HybridObject } from 'react-native-nitro-modules';
export type NitroInAppBrowserDismissButtonLabel = 'cancel' | 'done' | 'close';
export declare enum NitroInAppBrowserPresentationStyle {
    PageSheet = "pageSheet",
    FormSheet = "formSheet"
}
export interface NitroInAppBrowserOptions {
    dismissButtonLabel?: NitroInAppBrowserDismissButtonLabel;
    presentationStyle?: string;
    barColor?: string;
    controlColor?: string;
}
export interface NitroInAppBrowser extends HybridObject<{
    ios: 'swift';
    android: 'kotlin';
}> {
    open(url: string, options?: NitroInAppBrowserOptions): void;
    close(): void;
}
