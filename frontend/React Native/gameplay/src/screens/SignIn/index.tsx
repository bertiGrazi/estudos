/*Define a estrutura da minha interface - Componentes*/ 
import React, { useState }from "react";
import { View, Text, TextInput } from "react-native";

import { styles } from './styles';

export default function SignIn() {
  const [text, setText] = useState('');

  return(
    <View style={styles.container}>
      <Text>Hello World, NWL Together</Text>
        <TextInput 
          style={styles.input}
          onChangeText={setText}
        />
        <Text>
        Você digitou: { text }
      </Text>
    </View>
  );
}