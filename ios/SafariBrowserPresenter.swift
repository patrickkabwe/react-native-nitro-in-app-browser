//
//  SafariBrowserPresenter.swift
//  NitroInAppBrowser
//
//  Created by Patrick Kabwe on 19/12/2024.
//

import Foundation
import NitroModules
import SafariServices

// MARK: - Browser Presenting
protocol BrowserPresenting {
    func present(url: URL, options: NitroInAppBrowserOptions?) throws
    func dismiss()
}

class SafariBrowserPresenter: NSObject, BrowserPresenting {
    private weak var safariVC: SFSafariViewController?
    private let configuration: BrowserConfiguration
    private var currentBrowser: SFSafariViewController? = nil
    private var isPresenting = false
    
    init(configuration: BrowserConfiguration = BrowserConfiguration()) {
        self.configuration = configuration
        super.init()
    }
    
    func present(url: URL, options: NitroInAppBrowserOptions?) throws {
        guard !isPresenting else {
            throw RuntimeError.error(withMessage: "Browser already presenting")
        }
        let config = SFSafariViewController.Configuration()
        config.barCollapsingEnabled = false
        config.entersReaderIfAvailable = false
        
        let safariVC = SFSafariViewController(url: url, configuration: config)
        safariVC.delegate = self
        self.safariVC = safariVC
        
        configuration.configure(safariVC: safariVC, options: options)
        
        let rootVC = try getRootViewController()
        
        self.cleanupBrowser()
        self.isPresenting = true
        
       rootVC.present(safariVC, animated: true)
    }
    
    func dismiss() {
        cleanupBrowser()
    }
    
    private func cleanupBrowser() {
        safariVC?.dismiss(animated: true)
        safariVC = nil
        isPresenting = false
    }


    deinit {
        cleanupBrowser()
    }
}

extension SafariBrowserPresenter: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        cleanupBrowser()
    }
}

extension SafariBrowserPresenter {    
    func getRootViewController() throws -> UIViewController {
        guard let windowScene = UIApplication.shared
            .connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let rootVC = windowScene
            .windows
            .first(where: { $0.isKeyWindow })?
            .rootViewController else {
            throw RuntimeError.error(withMessage: "Failed to get root view controller getRootViewController(...)")
        }
        return rootVC
    }
}
