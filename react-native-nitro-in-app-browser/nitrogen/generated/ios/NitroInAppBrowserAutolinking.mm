///
/// NitroInAppBrowserAutolinking.mm
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

#import <Foundation/Foundation.h>
#import <NitroModules/HybridObjectRegistry.hpp>
#import "NitroInAppBrowser-Swift-Cxx-Umbrella.hpp"
#import <type_traits>

#include "HybridNitroInAppBrowserSpecSwift.hpp"

@interface NitroInAppBrowserAutolinking : NSObject
@end

@implementation NitroInAppBrowserAutolinking

+ (void) load {
  using namespace margelo::nitro;
  using namespace margelo::nitro::inappbrowser;

  HybridObjectRegistry::registerHybridObjectConstructor(
    "NitroInAppBrowser",
    []() -> std::shared_ptr<HybridObject> {
      std::shared_ptr<margelo::nitro::inappbrowser::HybridNitroInAppBrowserSpec> hybridObject = NitroInAppBrowser::NitroInAppBrowserAutolinking::createNitroInAppBrowser();
      return hybridObject;
    }
  );
}

@end