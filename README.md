
# rem
### Table of contents
- [System requirements](#system-requirements)
- [Application structure](#project-structure)
- [Libraries and tools used](#libraries-and-tools-used)

### System requirements

Dart SDK Version 3.0.0 or greater.
Flutter SDK Version 3.16.0 or greater.

### Application structure

```
.
├── android                       - It contains files required to run the application on an Android platform.
├── assets                        - It contains all images and fonts of the application.
├── ios                           - It contains files required to run the application on an iOS platform.
├── lib                           - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                 - Starting point of the application
    ├── rem.dart                  - THE APP!
    ├── app                       - It constains all the base/initial view, controller, bindings, controller, services etc to structure the app
    ├── helpers
    │   ├── app_export.dart       - It contains commonly used file imports
    │   ├── constants             - It contains all constants classes               
    │   ├── connectivity          - It contains connectivity-related classes
    │   └── utils                 - It contains common files and utilities of the application
    ├── flavors                   - It contains build and enviroment configurations for the application
    ├── network                   - It contains network/dio client configuration 
    ├── data
    │   ├── models                - It contains request/response models 
    │   └── repository            - Network repository
    ├── localization              - It contains localization classes
    ├── modules                   - It contains widgets of the screens with their controllers and the models of the whole application.
    ├── routes                    - It contains all the routes of the application
    ├── theme                     - It contains app theme configuration
    └── components                - It contains all custom widget classes  
```

### Libraries and tools used

- get - State management
  https://pub.dev/packages/get
- connectivity_plus - For status of network connectivity
  https://pub.dev/packages/connectivity_plus
- shared_preferences - Provide persistent storage for simple data
  https://pub.dev/packages/shared_preferences
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image
- flutter_svg - For rendering svg files
  https://pub.dev/packages/flutter_svg
- dio - For networking
  https://pub.dev/packages/dio
- dio_cache_interceptor: - For network data caching
  https://pub.dev/packages/dio_cache_interceptor
- firebase_core: - To use Firebase api and app
  https://pub.dev/packages/firebase_core
- firebase_auth: - To use Firebase Authentication api
  https://pub.dev/packages/firebase_auth
- google_sign_in: - To access Google Sign-In
  https://pub.dev/packages/google_sign_in
- google_sign_in: - To access Google Sign-In
  https://pub.dev/packages/google_sign_in
- crypto: - For Encrypting userId to do CRUD operation for notes
  https://pub.dev/packages/crypto
- flutter_secure_storage: - For Storing notes
  https://pub.dev/packages/flutter_secure_storage
- flutter_local_notifications - For using local notification for tasks
  https://pub.dev/packages/flutter_local_notifications
- timezone - For using time zone aware DateTime class for local notification
  https://pub.dev/packages/timezone
- dropdown_search - For using dropdown as Widget for Note status modification
  https://pub.dev/packages/dropdown_search
- flutter_datetime_picker_plus - For using datetime selection widget for Note DateTime modification
  https://pub.dev/packages/flutter_datetime_picker_plus
- intl - For localization/internationalization
  https://pub.dev/packages/intl



