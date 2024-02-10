
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
    ├── helpers
    │   ├── app_export.dart       - It contains commonly used file imports
    │   ├── constants             - It contains all constants classes
    │   ├── errors                - It contains error handling classes                  
    │   ├── connectivity          - It contains connectivity-related classes
    │   └── utils                 - It contains common files and utilities of the application
    ├── data
    │   ├── apiClient             - It contains API calling methods 
    │   ├── models                - It contains request/response models 
    │   └── repository            - Network repository
    ├── localization              - It contains localization classes
    ├── modules                   - It contains widgets of the screens with their controllers and the models of the whole application.
    ├── routes                    - It contains all the routes of the application
    ├── theme                     - It contains app theme and decoration classes
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


