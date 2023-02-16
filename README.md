# oddshub


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# SET UP
- install `FVM` (Flutter Version Management) or install `SDK`
- using flutter `3.7.3`
- run `flutter doctor` and do follow the suggest step for make the check on doctor summary
- run `flutter pub get`

# STEP FOR RUN
- open Simulator
- run `flutter run`

# STEP FOR RUN ACTUAL DEVICE
- when plug device to this computer choose to trust this computer when prompted.
- enable Developer Mode in Settings → Privacy & Security -> Developer Mode 
- If we cannot find Developer Mode Open Xcode
    - select your device > run project 
    - your device > Settings > General > Device Management > [your new certificate] > Trust 

# WORKING AGREEMENT
- Run `make lint` and `make app-test` or Run `make all` before push

# DISABLE WEB DESKTOP
- Project won't generate new file for desktop 
```
Run

flutter config --no-enable-web
flutter config --no-enable-macos-desktop --no-enable-windows-desktop --no-enable-linux-desktop
```

# RUN BUILD MODE
- Trainee mode (Can register course)
```
flutter run --dart-define=IS_TRAINER=false or flutter run
```

- Trainer mode (Can send email)
```
flutter run --dart-define=IS_TRAINER=true
```
add `--release` in Release Mode
