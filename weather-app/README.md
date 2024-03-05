# Desafio

## Resumo

Projeto criado para a empresa Magazord avaliar minha experiência em React Native e Flutter

## Versões

```
NodeJS: v21.6.1
react-native: 0.73.4
```

Desenvolvido em um computador com Windows 10 utilizando o Visual Studio Code

## Organização das pastas

`src`
- `components`

    Pasta onde é armazenado todos os componentes visuais das telas

- `screens`

    Pasta onde é armazenado todas as telas do app

- `services`

    Pasta onde é armazenado os serviços do app, como por exemplo, serviço para obter a localização do usuário e requisição na API de clima

- `styles`

    Onde fica armazenado os arquivos de estilos comuns utilizados no app todo

- `types`

    Onde ficam as classes/modelos utilizados no projeto para organizar melhor as informações obtidas pelos serviços, facilitando a visualização no código

## Inicialização do projeto

O projeto foi criado com o pacote [expo](https://docs.expo.dev/get-started/installation/) para facilitar o desenvolvimento do desafio e focar no que realmentre importa.

Para baixar as dependências do projeto utilize o comando:

```
npm install
```

ou se preferir caso tenha o [yarn](https://classic.yarnpkg.com/lang/en/docs/install/#windows-stable) instalado:

```
yarn
```


### Configurando variavel de ambiente

Para testar o aplicativo, crie uma conta e uma chave de API no site [OpenWeatherMap](https://openweathermap.org/)

Crie um arquivo na raiz do projeto, chamado `.env`

adicione a seguinte linha:

Substituindo `[SUA CHAVE DE API]` pela chave gerada no site

```
EXPO_PUBLIC_OPEN_WEATHER_MAP_API_KEY=[SUA CHAVE DE API]
```

----

Caso tenha o Android Studio configurado inicie o projeto em um dispositivo Android utilizando o comando:

```
npx expo start --android
```

Para iniciar o projeto em um dispositivo iOS:

```
npx expo start --ios
```

Para iniciar um servidor local e scannear o QRCode com o aplicativo do Expo Go, utilize:

```
npx expo start
```