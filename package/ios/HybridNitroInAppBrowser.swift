import Foundation
import SafariServices
import NitroModules
import React

class HybridNitroInAppBrowser : NSObject, HybridNitroInAppBrowserSpec, SFSafariViewControllerDelegate {
    public var memorySize: Int {
        return getSizeOf(self)
    }
    
    typealias native = margelo.nitro.inappbrowser
    public var hybridContext = margelo.nitro.HybridContext()
    
    private weak var safariVC: SFSafariViewController?
    
    func open(url stringUrl: String, options: NitroInAppBrowserOptions?) throws {
        guard let url = URL(string: stringUrl) else {
            throw InAppBrowserError.invalidURL
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.presentSafariViewController(with: url, options: options)
        }
    }
    
    func close() {
        DispatchQueue.main.async { [weak self] in
            self?.safariVC?.dismiss(animated: true)
            self?.safariVC = nil
        }
    }
    
    private func presentSafariViewController(with url: URL, options: NitroInAppBrowserOptions?) {
        let configuration = SFSafariViewController.Configuration()
        configuration.barCollapsingEnabled = false
        configuration.entersReaderIfAvailable = false
        
        let safariVC = SFSafariViewController(url: url, configuration: configuration)
        self.safariVC = safariVC
        self.safariVC?.delegate = self

        
        if let dismissButtonStyle = options?.dismissButtonLabel {
            safariVC.dismissButtonStyle = setDismissButtonStyle(dismissButtonStyle)
        }
        
        if let presentationStyle = options?.presentationStyle {
            safariVC.modalPresentationStyle = setPresentationStyle(presentationStyle)
        }
        
        if let preferredControlTintColor = options?.controlColor {
            safariVC.preferredControlTintColor = setPreferredControlTintColor(preferredControlTintColor)
        }
    
        
        if let preferredBarTintColor = options?.barColor {
            safariVC.preferredBarTintColor = setPreferredBarTintColor(preferredBarTintColor)
        }
        
        guard let presentingViewController = RCTPresentedViewController() else {
            print("ERROR: Unable to find presenting view controller")
            return
        }
        
        presentingViewController.present(safariVC, animated: true)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true)
        self.safariVC = nil
        print("Safari view controller did finish")
    }
}

enum InAppBrowserError: Error {
    case invalidURL
}


extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = 1.0

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

extension HybridNitroInAppBrowser {
    private func setDismissButtonStyle(_ style: NitroInAppBrowserDismissButtonLabel) -> SFSafariViewController.DismissButtonStyle {
        switch style {
        case .cancel:
            return .cancel
        case .close:
            return .close
        case .done:
            return .done
        }
    }
    
    private func setPresentationStyle(_ style: String) -> UIModalPresentationStyle {
        switch style {
        case "formSheet":
            return .formSheet
        case "pageSheet":
            return .pageSheet
        default:
            return .automatic
        }
    }
    
    private func setPreferredControlTintColor(_ color: String) -> UIColor? {
        guard let color = UIColor(hex: color) else { return nil }
        return color
    }
    
    private func setPreferredBarTintColor(_ color: String) -> UIColor? {
        guard let color = UIColor(hex: color) else {
            print("Error; ")
            return nil
        }
        return color
    }
}
