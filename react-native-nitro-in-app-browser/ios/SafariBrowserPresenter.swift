//
//  SafariBrowserPresenter.swift
//  NitroInAppBrowser
//
//  Created by Patrick Kabwe on 19/12/2024.
//

import Foundation
import NitroModules
import SafariServices
import React

// MARK: - Browser Presenting
protocol BrowserPresenting {
    func present(url: URL, options: NitroInAppBrowserOptions?) throws
    func dismiss()
}

class SafariBrowserPresenter: NSObject, BrowserPresenting, SFSafariViewControllerDelegate {
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
        
        guard let presentingVC = RCTPresentedViewController() else {
            throw RuntimeError.error(withMessage: "ERROR: Unable to find presenting view controller")
        }
        
        self.cleanupBrowser()
        self.isPresenting = true
        
        presentingVC.present(safariVC, animated: true)
    }
    
    func dismiss() {
        cleanupBrowser()
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        cleanupBrowser()
        controller.delegate = nil
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
