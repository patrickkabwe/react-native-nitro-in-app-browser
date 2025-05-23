///
/// JNitroInAppBrowserOptions.hpp
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2025 Marc Rousavy @ Margelo
///

#pragma once

#include <fbjni/fbjni.h>
#include "NitroInAppBrowserOptions.hpp"

#include "JNitroInAppBrowserDismissButtonLabel.hpp"
#include "NitroInAppBrowserDismissButtonLabel.hpp"
#include <optional>
#include <string>

namespace margelo::nitro::nitroinappbrowser {

  using namespace facebook;

  /**
   * The C++ JNI bridge between the C++ struct "NitroInAppBrowserOptions" and the the Kotlin data class "NitroInAppBrowserOptions".
   */
  struct JNitroInAppBrowserOptions final: public jni::JavaClass<JNitroInAppBrowserOptions> {
  public:
    static auto constexpr kJavaDescriptor = "Lcom/margelo/nitro/nitroinappbrowser/NitroInAppBrowserOptions;";

  public:
    /**
     * Convert this Java/Kotlin-based struct to the C++ struct NitroInAppBrowserOptions by copying all values to C++.
     */
    [[maybe_unused]]
    [[nodiscard]]
    NitroInAppBrowserOptions toCpp() const {
      static const auto clazz = javaClassStatic();
      static const auto fieldDismissButtonLabel = clazz->getField<JNitroInAppBrowserDismissButtonLabel>("dismissButtonLabel");
      jni::local_ref<JNitroInAppBrowserDismissButtonLabel> dismissButtonLabel = this->getFieldValue(fieldDismissButtonLabel);
      static const auto fieldPresentationStyle = clazz->getField<jni::JString>("presentationStyle");
      jni::local_ref<jni::JString> presentationStyle = this->getFieldValue(fieldPresentationStyle);
      static const auto fieldBarColor = clazz->getField<jni::JString>("barColor");
      jni::local_ref<jni::JString> barColor = this->getFieldValue(fieldBarColor);
      static const auto fieldControlColor = clazz->getField<jni::JString>("controlColor");
      jni::local_ref<jni::JString> controlColor = this->getFieldValue(fieldControlColor);
      return NitroInAppBrowserOptions(
        dismissButtonLabel != nullptr ? std::make_optional(dismissButtonLabel->toCpp()) : std::nullopt,
        presentationStyle != nullptr ? std::make_optional(presentationStyle->toStdString()) : std::nullopt,
        barColor != nullptr ? std::make_optional(barColor->toStdString()) : std::nullopt,
        controlColor != nullptr ? std::make_optional(controlColor->toStdString()) : std::nullopt
      );
    }

  public:
    /**
     * Create a Java/Kotlin-based struct by copying all values from the given C++ struct to Java.
     */
    [[maybe_unused]]
    static jni::local_ref<JNitroInAppBrowserOptions::javaobject> fromCpp(const NitroInAppBrowserOptions& value) {
      return newInstance(
        value.dismissButtonLabel.has_value() ? JNitroInAppBrowserDismissButtonLabel::fromCpp(value.dismissButtonLabel.value()) : nullptr,
        value.presentationStyle.has_value() ? jni::make_jstring(value.presentationStyle.value()) : nullptr,
        value.barColor.has_value() ? jni::make_jstring(value.barColor.value()) : nullptr,
        value.controlColor.has_value() ? jni::make_jstring(value.controlColor.value()) : nullptr
      );
    }
  };

} // namespace margelo::nitro::nitroinappbrowser
