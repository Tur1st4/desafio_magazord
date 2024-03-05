import React from 'react';
import { View, Text } from 'react-native';
import { LocationObject } from 'expo-location';
import { styles } from '../styles/home_styles';

interface LocationComponentProps {
  location: LocationObject;
}

const LocationComponent: React.FC<LocationComponentProps> = ({ location }) => {
  return (
    <View style={styles.container}>
      <Text>Latitude: {location.coords.latitude}</Text>
      <Text>Longitude: {location.coords.longitude}</Text>
    </View>
  );
};

export default LocationComponent;
