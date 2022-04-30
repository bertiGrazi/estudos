/*Define a estrutura da minha interface - Componentes*/ 
import React, { useState }from "react";
import { 
  View, 
  Text, 
  Image, 
} from "react-native";

// import IllustrationImg from '../../assets/i
import { styles } from './styles';

export default function SignIn() {
  const [text, setText] = useState('');

  return(
    <View style={styles.container}>
     <Text>Oi</Text>
    </View>
  );
}