// src/screens/HomeScreen.tsx

import React, { useEffect, useState } from 'react';
import { TouchableOpacity, View } from 'react-native';
import * as Location from 'expo-location';
import { AntDesign } from '@expo/vector-icons';
import { getLocationPermission } from '../services/location_permission_service';
import { getWeather } from '../services/weather_service';
import ErrorComponent from '../components/error_component';
import LoadingComponent from '../components/loading_component';
import LocationComponent from '../components/location_component';
import WeatherComponent from '../components/weather_compenent';
import { WeatherData } from '../types/types';
import { styles } from '../styles/home_styles';

const HomeScreen: React.FC = () => {
  const [location, setLocation] = useState<Location.LocationObject | null>(null);
  const [weatherData, setWeatherData] = useState<WeatherData | null>(null);
  const [error, setError] = useState<string | null>(null);

  const fetchData = async () => {
    try {
      const hasPermission = await getLocationPermission();

      if (hasPermission) {
        const locationData = await Location.getCurrentPositionAsync({});
        setLocation(locationData);
        setError(null);

        const data = await getWeather(locationData.coords.latitude, locationData.coords.longitude);
        setWeatherData(data);
      } else {
        setError('Permissão de localização não concedida.');
      }
    } catch (error) {
      console.error('Erro ao obter dados:', error);
      setError('Erro ao obter dados. Tente novamente.');
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const handleReload = () => {
    setWeatherData(null);
    setLocation(null);
    fetchData();
  };

  if (error) {
    return (
      <ErrorComponent
        message={error}
        onRetry={fetchData}
      />
    );
  }

  if (!location || !weatherData) {
    return (
      <LoadingComponent message="Obtendo dados..." />
    );
  }

  return (
    <View>
        <TouchableOpacity onPress={handleReload} style={{ alignSelf: 'flex-end', margin: 10 }}>
            <AntDesign name="reload1" size={24} color="black" />
        </TouchableOpacity>
        <LocationComponent
            location={location}
        />
        <WeatherComponent weatherData={weatherData} />
    </View>
  );
};

export default HomeScreen;
