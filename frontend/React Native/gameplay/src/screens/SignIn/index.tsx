/*Define a estrutura da minha interface - Componentes*/ 
import React, { useState }from "react";
import { 
  View, 
  Text, 
  Image, 
  StatusBar
} from "react-native";

import { ButtonIcon } from "../../components/ButtonIcon";
import IllustrationImg from '../../assets/illustration.png';
import { styles } from './styles';


export default function SignIn() {
  const [text, setText] = useState('');

  return(
    <View style={styles.container}>
      <StatusBar 
      barStyle="light-content"
      backgroundColor="transparent"
      translucent
      />
     <Image 
      source={IllustrationImg} 
      style={styles.image}
      resizeMode="stretch"
    />

    <View style={styles.content}>
      <Text style={styles.title}>
      Conecte-se {`\n`}
      e organize suas {`\n`}
      jogatinas
      </Text>

      <Text style={styles.subtitle}>
      Crie grupos para jogar seus games {`\n`}
      favoritos com seus amigos
      </Text>

      <ButtonIcon />
    </View>
    </View>
  );
}