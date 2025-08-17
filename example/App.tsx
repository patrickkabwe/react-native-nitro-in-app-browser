import React from 'react';
import {Alert, Button, StyleSheet} from 'react-native';
import NitroInAppBrowser from 'react-native-nitro-in-app-browser';
import {SafeAreaProvider, SafeAreaView} from 'react-native-safe-area-context';

const AppWrapper = () => {
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
              presentationStyle: 'fullScreen',
            });
          } catch (error) {
            Alert.alert('Error', (error as Error).message, [
              {
                text: 'OK',
                onPress: () => {},
              },
            ]);
          }
        }}
      />
    </SafeAreaView>
  );
};

const App = () => {
  return (
    <SafeAreaProvider>
      <AppWrapper />
    </SafeAreaProvider>
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
