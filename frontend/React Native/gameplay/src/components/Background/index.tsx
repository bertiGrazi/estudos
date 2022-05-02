import React, { ReactNode } from "react";
import { LinearGradient } from 'expo-linear-gradient';
import style  from "./styles";
import { theme } from "../../../global/styles/theme";


export function Background() {
  return(
    <LinearGradient
      style={style.container}
      colors={[theme.colors.secondary80, theme.colors.secondary100]}
    >
    </LinearGradient>
  );
}