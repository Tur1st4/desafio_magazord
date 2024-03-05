import * as Location from 'expo-location';

export const getLocationPermission = async (): Promise<boolean> => {
  try {
    let { status } = await Location.requestForegroundPermissionsAsync();
    return status === 'granted';
  } catch (error) {
    console.error('Erro ao obter permissão de localização:', error);
    return false;
  }
};
