import React from 'react';
import {AppRegistry, StyleSheet, Text, View} from 'react-native';

class App extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.hello}>Hello {this.props['name']} !</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  },
  hello: {
    fontSize: 20,
    textAlign: 'center',
  },
});

// Module name
AppRegistry.registerComponent('App', () => App);
