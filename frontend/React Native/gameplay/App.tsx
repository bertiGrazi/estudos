import React from "react";
import { StatusBar, View } from "react-native";
import { useFonts } from "expo-font";

import { Inter_400Regular, Inter_500Medium } from "@expo-google-fonts/inter";
import { Rajdhani_500Medium, Rajdhani_700Bold} from "@expo-google-fonts/rajdhani";
import AppLoading from "expo-app-loading";
import { LinearGradient } from 'expo-linear-gradient';

import SignIn from "./src/screens/SignIn";
import { theme } from "./global/styles/theme";
import { Background } from "./src/components/Background";


export default function App() {
  const [fonstLoaded] = useFonts({
    Inter_400Regular,
    Inter_500Medium,
    Rajdhani_500Medium,
    Rajdhani_700Bold
  });

  if(!fonstLoaded) {
    return <AppLoading />
  }

  return(
    <Background>
        < StatusBar
          barStyle="light-content"
          backgroundColor="transparent"
          translucent
        />
          <SignIn />
    </Background>
  );
}