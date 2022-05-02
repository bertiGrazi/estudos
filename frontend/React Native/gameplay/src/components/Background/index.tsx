import React, { ReactNode } from "react";
import { LinearGradient } from 'expo-linear-gradient';
import style  from "./styles";
import { theme } from "../../../global/styles/theme";
import { ViewProps } from "react-native";

interface BackgroundProps {
  children: JSX.Element[]
}

export function Background(props: BackgroundProps) {
  return(
    <LinearGradient
      style={style.container}
      colors={[theme.colors.secondary80, theme.colors.secondary100]}
    >
    {props.children}
    </LinearGradient>
  );
}