import React from "react";
import {Box, View, Text} from "native-base";

import { AntDesign } from '@expo/vector-icons'; 
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
        marginRight={4}
      >
        <Box>
            <Box flexDirection={'row'}>
            <Box marginTop={8} marginLeft={4}>
              <Text
                color={theme.colors.colorTitle}
                fontSize={14}
              >
                Entradas
              </Text>
            </Box>
            <Box marginTop={6} marginLeft={40}>
              <AntDesign name="upcircleo" size={32} color={theme.colors.green} />
            </Box>
          </Box>
          <Box marginTop={8} marginLeft={4}>
            <Text fontSize={32} color={theme.colors.colorTitle}>
              R$ 17.400,00
            </Text>
            <Text color={theme.colors.colorText}>
              Última entrada 13 de abril
            </Text>
          </Box>
        </Box>
      </View>
    </Box>
  );
}
