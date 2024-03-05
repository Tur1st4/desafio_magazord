

import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { WeatherData } from '../types/types';

interface WeatherComponentProps {
  weatherData: WeatherData;
}

const WeatherComponent: React.FC<WeatherComponentProps> = ({ weatherData }) => {
  if (!weatherData) {
    return (
      <View style={styles.container}>
        <Text style={styles.errorMessage}>Dados meteorológicos não disponíveis.</Text>
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Condições Meteorológicas em {weatherData.name}</Text>
      
      <View style={styles.infoContainer}>
        <Text style={styles.infoText}>Temperatura: {weatherData.main.temp.toFixed(2)} °C</Text>
        <Text style={styles.infoText}>Umidade: {weatherData.main.humidity}%</Text>
        <Text style={styles.infoText}>
          Condição: {weatherData.weather[0].description}
        </Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    backgroundColor: '#3498db',
    borderRadius: 10,
    padding: 20,
    margin: 10,
    borderWidth: 2,
    borderColor: 'black',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: 'white',
    marginBottom: 10,
  },
  condition: {
    fontSize: 18,
    color: 'white',
    marginBottom: 10,
  },
  infoContainer: {
    marginTop: 10,
  },
  infoText: {
    fontSize: 16,
    color: 'white',
    marginBottom: 5,
  },
  errorMessage: {
    fontSize: 16,
    color: 'white',
  },
});

export default WeatherComponent;
