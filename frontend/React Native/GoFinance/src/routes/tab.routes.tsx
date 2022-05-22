import React from "react";
import { Platform } from 'react-native';

import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { MaterialIcons } from "@expo/vector-icons";

import ListingFinance from "../screens/ListingFinance";
import Register from "../screens/Register";

const { Screen, Navigator } = createBottomTabNavigator();

export function TabRoutes() {
  return (
    <Navigator
      screenOptions={{
        tabBarActiveTintColor: "#FF872C",
        tabBarInactiveTintColor: "grey",
        tabBarLabelPosition: 'beside-icon',
        tabBarStyle: {
          paddingVertical: Platform.OS === 'ios' ? 20 : 0,
          height: 88,
        },
        headerShown: false,
      }}
    >
      <Screen
        name="listingFinance"
        component={ListingFinance}
        options={{
          tabBarLabel: "Listagem",
          tabBarIcon: ({ color, size }) => (
            <MaterialIcons name="format-list-bulleted" color={color} size={size} />
          ),
        }}
      />

      <Screen
        name="register"
        component={Register}
        options={{
          tabBarLabel: "Cadastrar",
          tabBarIcon: ({ color, size }) => (
            <MaterialIcons name="attach-money" color={color} size={size} />
          ),
        }}
      />
    </Navigator>
  );
}
