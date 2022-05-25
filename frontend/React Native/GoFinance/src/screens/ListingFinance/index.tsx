import React from "react";
import { NativeBaseProvider, Box, ScrollView, Text } from "native-base";
import { theme } from "../../style/theme";
import Header from "../../components/header";

export default function ListingFinance() {
  return (
    <NativeBaseProvider>
      <ScrollView backgroundColor={theme.colors.colorBackground}>
        <Box
          flex={1}
          backgroundColor={theme.colors.purple}
          height={250}
        >
        <Box marginLeft={8} marginTop={12}>
          <Header picture={"https://avatars.githubusercontent.com/u/70613625?v=4"} 
                  name={"Grazi"}/>
        </Box>
        </Box>
      </ScrollView>
    </NativeBaseProvider>
  );
}
