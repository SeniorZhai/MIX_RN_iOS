import React from 'react';
import {AppRegistry, StyleSheet, Text, View, NativeModules} from 'react-native';

var myBridgeModule = NativeModules.MyBridgeModule

class App extends React.Component {
  render() {
    myBridgeModule.addEventOne('message')
    return (
      <View style={styles.container}>
        <Text style={styles.hello}>Hello {this.props['name']} !</Text>
        <Text style={styles.hello} onPress={()=>this.pushValueTo()}>点击往原生传字符串+日期</Text>
        <Text style={styles.hello} onPress={()=>this.callBackOne()}>点击回调</Text>
        <Text style={styles.hello} onPress={()=>this.callPromise()}>Promises</Text>
        <Text style={styles.hello}>{myBridgeModule.constants}</Text>
      </View>
    );
  }

  pushValueTo = ()=>{
      myBridgeModule.addEventTwo('string',19910730);
  }

  callBackOne = ()=>{
    myBridgeModule.callBackOne(('我是RN给原生的'),(error, events) => {
      if (error) {
        console.error(error);
      } else {
        alert(events)
      }
    })
  }

   async callPromise(){
        try{
            var events=await myBridgeModule.callPromise();
            alert(events)
        }catch(e){
            console.error(e);
        }
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
