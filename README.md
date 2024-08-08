![MasterHeader](https://zphhqkbfmmilwzqcmdgu.supabase.co/storage/v1/object/public/profile/tiktokclone.webp)

## Download APK
Download the latest version of the app:
<a href="https://zphhqkbfmmilwzqcmdgu.supabase.co/storage/v1/object/public/videos/weatherForemost.apk?t=2024-08-08T20%3A06%3A41.232Z">Download APK</a>

#TimeFirst
 Welcome to the test repository, a mobile application designed to bring the weather from other cities. This project shows my experience in developing mobile applications using Flutter and demonstrates advanced techniques in handling real-time data from the ACCUWEATHERAPI API, employing clean architecture principles and state management with Flutter Bloc.

#Characteristics

 Clean Architecture: The application is structured using a clean architecture, ensuring scalability, maintainability, and testability.

 Flutter Bloc – Uses Flutter Bloc for efficient state management across different application modules.

# Used technology
 Flutter – for creating high-quality cross-platform mobile apps.
 API: AccuWeatherApi.
 Dart – The programming language used in conjunction with Flutter.

#Project structure
 Logging Page: You can add a city in the search engine in real time and select to add.

#SECUTIRY

 
    SECURITY API-KEYS: flutter-dart-define

    To configure the api, you must have or create a caperta in the main root,
    .vscode/luaunch.json

    Then create an api-keys.json file in the root path:
    {
       "api-key": "",
       "base-url": ""
    }

    Have the .vscode folder in the main root, then create a launch.json file and have this configuration (this configuration is to safely handle apikys):
    {
        "version": "0.2.0",
        "settings": [
         {
          "name": "Start",
          "request": "release",
          "type": "dart",
          "program": "lib/main.dart",
          "arguments": [
              "--dart-define-from-file=api-keys.json"
                   ]
         }
        ]
     }


#Architecture
 This project adheres to clean architecture guidelines, which are structured as follows:

 Data Layer: Manages data transactions and transformations to and from the database.

 Domain layer: Contains entities and business logic.

 Presentation Layer: Comprises UI and state management components handled by Flutter Bloc.
