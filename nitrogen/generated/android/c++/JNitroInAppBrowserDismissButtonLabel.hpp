///
/// JNitroInAppBrowserDismissButtonLabel.hpp
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2025 Marc Rousavy @ Margelo
///

#pragma once

#include <fbjni/fbjni.h>
#include "NitroInAppBrowserDismissButtonLabel.hpp"

namespace margelo::nitro::nitroinappbrowser {

  using namespace facebook;

  /**
   * The C++ JNI bridge between the C++ enum "NitroInAppBrowserDismissButtonLabel" and the the Kotlin enum "NitroInAppBrowserDismissButtonLabel".
   */
  struct JNitroInAppBrowserDismissButtonLabel final: public jni::JavaClass<JNitroInAppBrowserDismissButtonLabel> {
  public:
    static auto constexpr kJavaDescriptor = "Lcom/margelo/nitro/nitroinappbrowser/NitroInAppBrowserDismissButtonLabel;";

  public:
    /**
     * Convert this Java/Kotlin-based enum to the C++ enum NitroInAppBrowserDismissButtonLabel.
     */
    [[maybe_unused]]
    [[nodiscard]]
    NitroInAppBrowserDismissButtonLabel toCpp() const {
      static const auto clazz = javaClassStatic();
      static const auto fieldOrdinal = clazz->getField<int>("_ordinal");
      int ordinal = this->getFieldValue(fieldOrdinal);
      return static_cast<NitroInAppBrowserDismissButtonLabel>(ordinal);
    }

  public:
    /**
     * Create a Java/Kotlin-based enum with the given C++ enum's value.
     */
    [[maybe_unused]]
    static jni::alias_ref<JNitroInAppBrowserDismissButtonLabel> fromCpp(NitroInAppBrowserDismissButtonLabel value) {
      static const auto clazz = javaClassStatic();
      static const auto fieldCANCEL = clazz->getStaticField<JNitroInAppBrowserDismissButtonLabel>("CANCEL");
      static const auto fieldDONE = clazz->getStaticField<JNitroInAppBrowserDismissButtonLabel>("DONE");
      static const auto fieldCLOSE = clazz->getStaticField<JNitroInAppBrowserDismissButtonLabel>("CLOSE");
      
      switch (value) {
        case NitroInAppBrowserDismissButtonLabel::CANCEL:
          return clazz->getStaticFieldValue(fieldCANCEL);
        case NitroInAppBrowserDismissButtonLabel::DONE:
          return clazz->getStaticFieldValue(fieldDONE);
        case NitroInAppBrowserDismissButtonLabel::CLOSE:
          return clazz->getStaticFieldValue(fieldCLOSE);
        default:
          std::string stringValue = std::to_string(static_cast<int>(value));
          throw std::invalid_argument("Invalid enum value (" + stringValue + "!");
      }
    }
  };

} // namespace margelo::nitro::nitroinappbrowser
