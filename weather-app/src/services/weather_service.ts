import { WeatherData } from '../types/types';

export const getWeather = async (latitude: number, longitude: number): Promise<WeatherData> => {
  try {
    const OPEN_WEATHER_MAP_API_KEY = process.env.EXPO_PUBLIC_OPEN_WEATHER_MAP_API_KEY;

    if (!OPEN_WEATHER_MAP_API_KEY) {
      throw new Error('API Key não configurada');
    }

    const response = await fetch(
      `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${OPEN_WEATHER_MAP_API_KEY}`
    );

    if (!response.ok) {
      throw new Error('Erro ao obter dados meteorológicos');
    }

    const data: WeatherData = await response.json();

    if (!data) {
      throw new Error('Dados meteorológicos indefinidos');
    }

    data.main.temp = data.main.temp - 273.15;

    return data;
  } catch (error) {
    console.error('Erro ao obter dados meteorológicos:', error);
    throw error;
  }
};

