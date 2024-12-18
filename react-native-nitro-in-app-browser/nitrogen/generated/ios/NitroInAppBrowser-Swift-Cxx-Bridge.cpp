///
/// NitroInAppBrowser-Swift-Cxx-Bridge.cpp
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

#include "NitroInAppBrowser-Swift-Cxx-Bridge.hpp"

// Include C++ implementation defined types
#include "HybridNitroInAppBrowserSpecSwift.hpp"
#include "NitroInAppBrowser-Swift-Cxx-Umbrella.hpp"
#include <NitroModules/HybridContext.hpp>

namespace margelo::nitro::inappbrowser::bridge::swift {

  // pragma MARK: std::shared_ptr<margelo::nitro::inappbrowser::HybridNitroInAppBrowserSpec>
  std::shared_ptr<margelo::nitro::inappbrowser::HybridNitroInAppBrowserSpec> create_std__shared_ptr_margelo__nitro__inappbrowser__HybridNitroInAppBrowserSpec_(void* _Nonnull swiftUnsafePointer) {
    NitroInAppBrowser::HybridNitroInAppBrowserSpecCxx swiftPart = NitroInAppBrowser::HybridNitroInAppBrowserSpecCxxUnsafe::fromUnsafe(swiftUnsafePointer);
    return HybridContext::getOrCreate<margelo::nitro::inappbrowser::HybridNitroInAppBrowserSpecSwift>(swiftPart);
  }
  void* _Nonnull get_std__shared_ptr_margelo__nitro__inappbrowser__HybridNitroInAppBrowserSpec_(std__shared_ptr_margelo__nitro__inappbrowser__HybridNitroInAppBrowserSpec_ cppType) {
    std::shared_ptr<margelo::nitro::inappbrowser::HybridNitroInAppBrowserSpecSwift> swiftWrapper = std::dynamic_pointer_cast<margelo::nitro::inappbrowser::HybridNitroInAppBrowserSpecSwift>(cppType);
  #ifdef NITRO_DEBUG
    if (swiftWrapper == nullptr) [[unlikely]] {
      throw std::runtime_error("Class \"HybridNitroInAppBrowserSpec\" is not implemented in Swift!");
    }
  #endif
    NitroInAppBrowser::HybridNitroInAppBrowserSpecCxx swiftPart = swiftWrapper->getSwiftPart();
    return NitroInAppBrowser::HybridNitroInAppBrowserSpecCxxUnsafe::toUnsafe(swiftPart);
  }

} // namespace margelo::nitro::inappbrowser::bridge::swift
