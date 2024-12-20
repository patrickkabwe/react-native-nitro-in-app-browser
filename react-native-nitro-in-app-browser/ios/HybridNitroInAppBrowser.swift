//
//  HybridNitroInAppBrowser.swift
//  NitroInAppBrowser
//
//  Created by Patrick Kabwe on 19/12/2024.
//

import Foundation
import NitroModules

class HybridNitroInAppBrowser: HybridNitroInAppBrowserSpec {
    private let browserPresenter: BrowserPresenting = SafariBrowserPresenter()
    
    func open(url stringUrl: String, options: NitroInAppBrowserOptions?) throws -> Promise<Void> {
        guard let url = URL(string: stringUrl) else {
            throw RuntimeError.error(withMessage: "Invalid URL")
        }
        
        return Promise.async {
            return try await withCheckedThrowingContinuation { continuation in
                DispatchQueue.main.async { [weak self] in
                    do {
                        try self?.browserPresenter.present(url: url, options: options)
                        continuation.resume()
                    } catch let error {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    func close() {
        DispatchQueue.main.async { [weak self] in
            self?.browserPresenter.dismiss()
        }
    }
}
