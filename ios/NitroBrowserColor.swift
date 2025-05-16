//
//  NitroBrowserColor.swift
//  NitroInAppBrowser
//
//  Created by Patrick Kabwe on 19/12/2024.
//

import Foundation
import UIKit

extension UIColor {
    convenience init?(value: String) {
        let r, g, b, a: CGFloat
        let value = value.trimmingCharacters(in: .whitespacesAndNewlines)

        if value.hasPrefix("#") {
            let start = value.index(value.startIndex, offsetBy: 1)
            let hexColor = String(value[start...])

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
        } else {
            let colorName = value.lowercased()
            switch colorName {
            case "black":
                self.init(red: 0, green: 0, blue: 0, alpha: 1)
            case "darkgray", "darkgrey":
                self.init(red: 0.333, green: 0.333, blue: 0.333, alpha: 1)
            case "lightgray", "lightgrey":
                self.init(red: 0.667, green: 0.667, blue: 0.667, alpha: 1)
            case "white":
                self.init(red: 1, green: 1, blue: 1, alpha: 1)
            case "gray", "grey":
                self.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
            case "red":
                self.init(red: 1, green: 0, blue: 0, alpha: 1)
            case "green":
                self.init(red: 0, green: 1, blue: 0, alpha: 1)
            case "blue":
                self.init(red: 0, green: 0, blue: 1, alpha: 1)
            case "cyan":
                self.init(red: 0, green: 1, blue: 1, alpha: 1)
            case "yellow":
                self.init(red: 1, green: 1, blue: 0, alpha: 1)
            case "magenta":
                self.init(red: 1, green: 0, blue: 1, alpha: 1)
            case "orange":
                self.init(red: 1, green: 0.5, blue: 0, alpha: 1)
            case "purple":
                self.init(red: 0.5, green: 0, blue: 0.5, alpha: 1)
            case "brown":
                self.init(red: 0.6, green: 0.4, blue: 0.2, alpha: 1)
            case "clear":
                self.init(red: 0, green: 0, blue: 0, alpha: 0)
            default:
                return nil
            }
            return
        }
        return nil
    }
}


