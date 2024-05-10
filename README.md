## About

With the concept of monorepo, a big project can be split into many small packages (call `service` or `repo`) so we can maintenance or test each module easily.

## Guide
Guide is available at [Medium article](https://medium.com/@tungnd.dev/micro-frontend-in-flutter-modularization-application-dde7dea454e4).


## Run
* Install Flutter 3.13.4
* Install `melos` by run `dart pub global activate melos`
* Run `melos bootstrap` to pub get all packages
* Run `melos gen-l10n` to generate language files for all packages
* Run `flutter pub get` to get and sync all libraries
* Run `flutter gen-l10n` to generate language files for main app
* Run on device  `flutter run`

## Roadmap
* [x] Build shared (ui, core) modules
* [x] Build authetication module
* [x] Build a functional module
* [ ] Testing for shared modules
* [ ] Testing for functional module
* [ ] Create example for fucntional module and run locally (without Main Application)
* [ ] [Improve] Now `successView()` function is confused about generic type
* [ ] [Improve] Consider concept linking `controller` - `screen`, one `controller` has many `blocs`, instead of linking `bloc` - `screen`


