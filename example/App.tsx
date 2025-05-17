import React from 'react';
import {Button, SafeAreaView, StyleSheet} from 'react-native';
import NitroInAppBrowser, {
  NitroInAppBrowserPresentationStyle,
} from 'react-native-nitro-in-app-browser';

const App = () => {
  return (
    <SafeAreaView style={styles.container}>
      <Button
        title="Open Nowie Tech"
        onPress={async () => {
          try {
            await NitroInAppBrowser.open('https://nowietech.com', {
              barColor: 'purple',
              controlColor: '#000000',
              dismissButtonLabel: 'close',
              presentationStyle: NitroInAppBrowserPresentationStyle.FullScreen,
            });
          } catch (error) {
            console.error(error);
          }
        }}
      />
    </SafeAreaView>
  );
};

export default App;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
