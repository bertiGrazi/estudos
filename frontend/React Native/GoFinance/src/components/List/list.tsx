import React from "react";
import {Box, View} from "native-base";

import { theme } from "../../style/theme";


export default function List() {
  return (
    <Box>
      <View
        backgroundColor={theme.colors.white}
        height={180}
        width={300}
        borderRadius={8}
        marginLeft={4}
      ></View>
    </Box>
  );
}
