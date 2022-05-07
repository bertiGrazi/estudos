import React from 'react';
import { View } from 'react-native';
import * as AuthSession from 'expo-auth-session';
import { useNavigation } from '@react-navigation/native';

import { Button } from '../../components/Button';
import { SignInContent } from '../../components/SignInContent';

import { styles } from './styles';

export function SignIn() {
  const navigation = useNavigation();

  async function handleSignIn() {
    const CLIENT_ID = '20585366123-caq31kam51kd2stea8s23j2u1u4v1spt.apps.googleusercontent.com';
    const REDIRECT_URI = 'https://auth.expo.io/@testegraziberti/oauth2app';
    const RESPONSE_TYPE = 'token';
    const SCOPE = encodeURI('profile email');


    const authUrl = `https://accounts.google.com/o/oauth2/v2/auth?client_id=${CLIENT_ID}&redirect_uri=${REDIRECT_URI}&response_type=${RESPONSE_TYPE}&scope=${SCOPE}`;
    const responde = await AuthSession.startAsync({ authUrl })
    console.log(responde)

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