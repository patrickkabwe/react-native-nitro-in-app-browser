///
/// HybridNitroInAppBrowserSpecSwift.hpp
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

#pragma once

#include "HybridNitroInAppBrowserSpec.hpp"

// Forward declaration of `HybridNitroInAppBrowserSpecCxx` to properly resolve imports.
namespace NitroInAppBrowser { class HybridNitroInAppBrowserSpecCxx; }

// Forward declaration of `NitroInAppBrowserOptions` to properly resolve imports.
namespace margelo::nitro::inappbrowser { struct NitroInAppBrowserOptions; }
// Forward declaration of `NitroInAppBrowserDismissButtonLabel` to properly resolve imports.
namespace margelo::nitro::inappbrowser { enum class NitroInAppBrowserDismissButtonLabel; }

#include <string>
#include <optional>
#include "NitroInAppBrowserOptions.hpp"
#include "NitroInAppBrowserDismissButtonLabel.hpp"

#if __has_include(<NitroModules/HybridContext.hpp>)
#include <NitroModules/HybridContext.hpp>
#else
#error NitroModules cannot be found! Are you sure you installed NitroModules properly?
#endif

#include "NitroInAppBrowser-Swift-Cxx-Umbrella.hpp"

namespace margelo::nitro::inappbrowser {

  /**
   * The C++ part of HybridNitroInAppBrowserSpecCxx.swift.
   *
   * HybridNitroInAppBrowserSpecSwift (C++) accesses HybridNitroInAppBrowserSpecCxx (Swift), and might
   * contain some additional bridging code for C++ <> Swift interop.
   *
   * Since this obviously introduces an overhead, I hope at some point in
   * the future, HybridNitroInAppBrowserSpecCxx can directly inherit from the C++ class HybridNitroInAppBrowserSpec
   * to simplify the whole structure and memory management.
   */
  class HybridNitroInAppBrowserSpecSwift: public virtual HybridNitroInAppBrowserSpec {
  public:
    // Constructor from a Swift instance
    explicit HybridNitroInAppBrowserSpecSwift(const NitroInAppBrowser::HybridNitroInAppBrowserSpecCxx& swiftPart):
      HybridObject(HybridNitroInAppBrowserSpec::TAG),
      _swiftPart(swiftPart) { }

  public:
    // Get the Swift part
    inline NitroInAppBrowser::HybridNitroInAppBrowserSpecCxx getSwiftPart() noexcept { return _swiftPart; }

  public:
    // Get memory pressure
    inline size_t getExternalMemorySize() noexcept override {
      return _swiftPart.getMemorySize();
    }

  public:
    // Properties
    

  public:
    // Methods
    inline void open(const std::string& url, const std::optional<NitroInAppBrowserOptions>& options) override {
      _swiftPart.open(url, options);
    }
    inline void close() override {
      _swiftPart.close();
    }

  private:
    NitroInAppBrowser::HybridNitroInAppBrowserSpecCxx _swiftPart;
  };

} // namespace margelo::nitro::inappbrowser