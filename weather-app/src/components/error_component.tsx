import React from 'react';
import { Text, TouchableOpacity, View } from 'react-native';
import { styles } from '../styles/home_styles';

interface ErrorComponentProps {
  message: string;
  onRetry: () => void;
}

const ErrorComponent: React.FC<ErrorComponentProps> = ({ message, onRetry }) => {
  return (
    <View style={styles.errorContainer}>
      <Text style={styles.errorMessage}>{message}</Text>
      <TouchableOpacity onPress={onRetry}>
        <Text style={styles.retryButton}>Tentar Novamente</Text>
      </TouchableOpacity>
    </View>
  );
};

export default ErrorComponent;
