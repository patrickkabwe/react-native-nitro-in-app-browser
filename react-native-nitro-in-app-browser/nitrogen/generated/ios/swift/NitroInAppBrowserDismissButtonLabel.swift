///
/// NitroInAppBrowserDismissButtonLabel.swift
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

/**
 * Represents the JS union `NitroInAppBrowserDismissButtonLabel`, backed by a C++ enum.
 */
public typealias NitroInAppBrowserDismissButtonLabel = margelo.nitro.inappbrowser.NitroInAppBrowserDismissButtonLabel

public extension NitroInAppBrowserDismissButtonLabel {
  /**
   * Get a NitroInAppBrowserDismissButtonLabel for the given String value, or
   * return `nil` if the given value was invalid/unknown.
   */
  init?(fromString string: String) {
    switch string {
      case "cancel":
        self = .cancel
      case "done":
        self = .done
      case "close":
        self = .close
      default:
        return nil
    }
  }

  /**
   * Get the String value this NitroInAppBrowserDismissButtonLabel represents.
   */
  var stringValue: String {
    switch self {
      case .cancel:
        return "cancel"
      case .done:
        return "done"
      case .close:
        return "close"
    }
  }
}