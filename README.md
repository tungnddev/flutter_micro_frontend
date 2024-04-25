## About

With the concept of monorepo, a big project can be split into many small packages (call `service` or `repo`) so we can maintenance or test each module easily

## Run
* Install Flutter 3.13.4
* Install `melos` by run `dart pub global activate melos`
* Run `melos bootstrap` to pub get all packages
* Run `melos gen-l10n` to generate language files for all packages
* Run `flutter pub get` to get and sync all library
* Run `flutter gen-l10n` to generate language files for main app
* Run on device  `flutter run`


