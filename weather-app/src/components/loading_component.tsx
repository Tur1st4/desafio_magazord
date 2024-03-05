// src/components/LoadingComponent.tsx

import React from 'react';
import { View, Text } from 'react-native';
import { styles } from '../styles/home_styles';

interface LoadingComponentProps {
  message: string;
}

const LoadingComponent: React.FC<LoadingComponentProps> = ({ message }) => {
  return (
    <View style={styles.loadingContainer}>
      <Text>{message}</Text>
    </View>
  );
};

export default LoadingComponent;
