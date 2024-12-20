//
//  BrowserConfiguration.swift
//  NitroInAppBrowser
//
//  Created by Patrick Kabwe on 19/12/2024.
//

import Foundation
import NitroModules
import SafariServices

// MARK: - Browser Configuration
struct BrowserConfiguration {
    func configure(safariVC: SFSafariViewController, options: NitroInAppBrowserOptions?) {
        // Configure colors
        safariVC.preferredControlTintColor = options?.controlColor.flatMap { UIColor(value: $0) }
        safariVC.preferredBarTintColor = options?.barColor.flatMap { UIColor(value: $0) }
        
        // Configure presentation style
        safariVC.modalPresentationStyle = configurePresentationStyle(for: options?.presentationStyle)
    

        // Configure dismiss button
        if let dismissStyle = options?.dismissButtonLabel {
            safariVC.dismissButtonStyle = configureDismissButtonStyle(dismissStyle)
        }
    }
    
    private func configurePresentationStyle(for style: String?) -> UIModalPresentationStyle {
        switch style {
        case "formSheet": return .formSheet
        case "pageSheet": return .pageSheet
        case "fullScreen": return .fullScreen
        default: return .automatic
        }
    }
    
    private func configureDismissButtonStyle(_ style: NitroInAppBrowserDismissButtonLabel?) -> SFSafariViewController.DismissButtonStyle {
        switch style {
        case .cancel: return .cancel
        case .close: return .close
        case .done, .none: return .done
        }
    }
}
