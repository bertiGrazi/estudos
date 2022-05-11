import React from "react";
import { createStackNavigator } from '@react-navigation/stack';

import { SignIn }  from "../screens/SignIn";
import { Home } from "../screens/Home";
import { theme } from "../../global/styles/theme";

const Stack = createStackNavigator();


export function AuthRouter() {
  return (
    <Stack.Navigator
     screenOptions={{
       cardStyle: {
        backgroundColor: theme.colors.secondary100,
        opacity: 1,
       },
       headerShown: false,
     }}
    >
        <Stack.Screen 
        name="SigIn" 
        component={SignIn}
        />
        
        <Stack.Screen 
        name="Home" 
        component={Home} 
        />
    </Stack.Navigator>
  );
}