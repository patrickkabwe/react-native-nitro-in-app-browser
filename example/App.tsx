import React from 'react';
import { Button, SafeAreaView } from 'react-native';
import {
  NitroInAppBrowser,
  NitroInAppBrowserPresentationStyle,
} from 'react-native-nitro-in-app-browser';

const App = () => {
  return (
    <SafeAreaView>
      <Button
        title="Open Google"
        onPress={() => {
          NitroInAppBrowser.open('https://www.google.com', {
            barColor: '#fef0f0',
            controlColor: '#000000',
            dismissButtonLabel: 'close',
            presentationStyle: NitroInAppBrowserPresentationStyle.PageSheet,
          });
        }}
      />
    </SafeAreaView>
  );
};

export default App;
