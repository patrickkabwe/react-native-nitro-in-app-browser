///
/// JHybridNitroInAppBrowserSpec.cpp
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2025 Marc Rousavy @ Margelo
///

#include "JHybridNitroInAppBrowserSpec.hpp"

// Forward declaration of `NitroInAppBrowserOptions` to properly resolve imports.
namespace margelo::nitro::nitroinappbrowser { struct NitroInAppBrowserOptions; }
// Forward declaration of `NitroInAppBrowserDismissButtonLabel` to properly resolve imports.
namespace margelo::nitro::nitroinappbrowser { enum class NitroInAppBrowserDismissButtonLabel; }

#include <NitroModules/Promise.hpp>
#include <NitroModules/JPromise.hpp>
#include <string>
#include <optional>
#include "NitroInAppBrowserOptions.hpp"
#include "JNitroInAppBrowserOptions.hpp"
#include "NitroInAppBrowserDismissButtonLabel.hpp"
#include "JNitroInAppBrowserDismissButtonLabel.hpp"

namespace margelo::nitro::nitroinappbrowser {

  jni::local_ref<JHybridNitroInAppBrowserSpec::jhybriddata> JHybridNitroInAppBrowserSpec::initHybrid(jni::alias_ref<jhybridobject> jThis) {
    return makeCxxInstance(jThis);
  }

  void JHybridNitroInAppBrowserSpec::registerNatives() {
    registerHybrid({
      makeNativeMethod("initHybrid", JHybridNitroInAppBrowserSpec::initHybrid),
    });
  }

  size_t JHybridNitroInAppBrowserSpec::getExternalMemorySize() noexcept {
    static const auto method = javaClassStatic()->getMethod<jlong()>("getMemorySize");
    return method(_javaPart);
  }

  // Properties
  

  // Methods
  std::shared_ptr<Promise<void>> JHybridNitroInAppBrowserSpec::open(const std::string& url, const std::optional<NitroInAppBrowserOptions>& options) {
    static const auto method = javaClassStatic()->getMethod<jni::local_ref<JPromise::javaobject>(jni::alias_ref<jni::JString> /* url */, jni::alias_ref<JNitroInAppBrowserOptions> /* options */)>("open");
    auto __result = method(_javaPart, jni::make_jstring(url), options.has_value() ? JNitroInAppBrowserOptions::fromCpp(options.value()) : nullptr);
    return [&]() {
      auto __promise = Promise<void>::create();
      __result->cthis()->addOnResolvedListener([=](const jni::alias_ref<jni::JObject>& /* unit */) {
        __promise->resolve();
      });
      __result->cthis()->addOnRejectedListener([=](const jni::alias_ref<jni::JThrowable>& __throwable) {
        jni::JniException __jniError(__throwable);
        __promise->reject(std::make_exception_ptr(__jniError));
      });
      return __promise;
    }();
  }
  std::shared_ptr<Promise<void>> JHybridNitroInAppBrowserSpec::close() {
    static const auto method = javaClassStatic()->getMethod<jni::local_ref<JPromise::javaobject>()>("close");
    auto __result = method(_javaPart);
    return [&]() {
      auto __promise = Promise<void>::create();
      __result->cthis()->addOnResolvedListener([=](const jni::alias_ref<jni::JObject>& /* unit */) {
        __promise->resolve();
      });
      __result->cthis()->addOnRejectedListener([=](const jni::alias_ref<jni::JThrowable>& __throwable) {
        jni::JniException __jniError(__throwable);
        __promise->reject(std::make_exception_ptr(__jniError));
      });
      return __promise;
    }();
  }

} // namespace margelo::nitro::nitroinappbrowser
