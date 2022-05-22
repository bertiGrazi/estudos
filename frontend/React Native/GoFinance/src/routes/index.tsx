import React from "react";
import { NavigationContainer } from '@react-navigation/native';

import { TabRoutes } from '../routes/tab.routes'

export default function Routes() {
  return (
    <NavigationContainer>
      <TabRoutes />
    </NavigationContainer>
  );
}