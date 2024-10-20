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
