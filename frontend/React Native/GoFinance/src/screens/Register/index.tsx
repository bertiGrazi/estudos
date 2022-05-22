import React from "react";
import { NativeBaseProvider, Box, Heading } from "native-base";

export default function Register() {
  return (
    <NativeBaseProvider>
      <Box
        justifyContent={"center"}
        alignItems={"center"}
        flex={1}
        backgroundColor={'#F0F2F5'}
      >
        <Heading
          justifyContent={"center"}
          alignItems={"center"}
          bold
          color={'#000000'}
        >
          Tela de Cadastro
        </Heading>
      </Box>
    </NativeBaseProvider>
  );
}