import React from 'react';
import { View } from 'react-native';
import { useNavigation } from '@react-navigation/native';

import { Button } from '../../components/Button';
import { SignInContent } from '../../components/SignInContent';

import { styles } from './styles';

export function SignIn() {
  const navigation = useNavigation();

  async function handleSignIn() {
    navigation.navigate('Profile');
  }

  return (
    <View style={styles.container}>
      <SignInContent />

      <Button
        title="Entrar com Google"
        icon="social-google"
        onPress={handleSignIn}
      />
    </View>
  );
}