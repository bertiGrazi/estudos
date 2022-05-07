import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { Routes } from './src/routes';

export default function App() {
  return (
    <View
    style={{
      flex: 1,
      backgroundColor: "#F24182"
    }}>

    <StatusBar
      style="light"
      backgroundColor="transparent"
      translucent
    />
    
    <Routes />
  </View>
  );
}
