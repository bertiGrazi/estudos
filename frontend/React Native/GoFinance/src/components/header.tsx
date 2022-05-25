import React from "react";
import { Avatar, Text, Box } from "native-base";
import { AntDesign } from '@expo/vector-icons'; 

import { theme } from "../style/theme";

type Props = {
  picture: string 
  name: string
}
export default function Header({picture, name}: Props) {
  return (
  <Box flexDirection={'row'}>
    <Avatar source={{ uri: picture }} size={'md'}>
    </Avatar>
    <Box justifyContent={'space-around'}>
      <Text
        fontSize={'sm'}
        color={theme.colors.white}
        italic
        marginLeft={2}
      >Olá, </Text>
      <Text
        fontSize={'xl'}
        color={theme.colors.white}
        bold
        marginLeft={2}
      >
        {name}
      </Text>
    </Box>
    <Box marginLeft={120} flexDirection={'row'}>
      <AntDesign name="eyeo" size={34} color={theme.colors.orange} />
    </Box>
    <Box marginLeft={4} marginTop={1}>
      <AntDesign name="poweroff" size={26} color={theme.colors.orange}/>
    </Box>
  </Box>
  );
}
