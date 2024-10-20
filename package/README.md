# react-native-nitro-in-app-browser

A Simple React Native Nitro module for in-app browser.


[![Build Android](https://github.com/patrickkabwe/react-native-nitro-in-app-browser/actions/workflows/android-build.yml/badge.svg)](https://github.com/patrickkabwe/react-native-nitro-in-app-browser/actions/workflows/android-build.yml)
[![Build iOS](https://github.com/patrickkabwe/react-native-nitro-in-app-browser/actions/workflows/ios-build.yml/badge.svg)](https://github.com/patrickkabwe/react-native-nitro-in-app-browser/actions/workflows/ios-build.yml)

[![npm version](https://img.shields.io/npm/v/react-native-nitro-in-app-browser.svg?style=flat-square)](https://www.npmjs.com/package/react-native-nitro-in-app-browser)
[![npm downloads](https://img.shields.io/npm/dm/react-native-nitro-in-app-browser.svg?style=flat-square)](https://www.npmjs.com/package/react-native-nitro-in-app-browser)



## Installation

```sh
npm install react-native-nitro-in-app-browser
```

## Usage

```js
import React from 'react';
import { Button, SafeAreaView } from 'react-native';
import { NitroInAppBrowser } from 'react-native-nitro-in-app-browser';

const App = () => {
  return (
    <SafeAreaView>
      <Button
        title="Open Google"
        onPress={() => {
          NitroInAppBrowser.open('https://www.google.com');
        }}
      />
    </SafeAreaView>
  );
};

export default App;
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License
    
MIT

---

Made with ❤️ by [Patrick Kabwe](https://github.com/patrickkabwe) and [contributors](https://github.com/patrickkabwe/react-native-nitro-in-app-browser/graphs/contributors).


## Credits

This package is based on the [react-native-nitro-modules](https://github.com/mrousavy/react-native-nitro-modules) package.
