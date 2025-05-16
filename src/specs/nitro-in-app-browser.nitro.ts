import { type HybridObject } from 'react-native-nitro-modules';
import type { NitroInAppBrowserOptions } from '../types';
export interface NitroInAppBrowser
    extends HybridObject<{ ios: 'swift'; android: 'kotlin' }> {
    open(url: string, options?: NitroInAppBrowserOptions): Promise<void>
    close(): void
}
