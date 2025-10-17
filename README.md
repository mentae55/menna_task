# Menna Task

This repository contains the Menna Task mobile application built primarily with Dart (Flutter). The README below documents the project structure, tools used, how to run and build the app, and instructions for adding design screenshots. It also enforces a professional, organized folder layout.

---

## Project Overview

Menna Task is a mobile application implemented using Dart and Flutter (with minimal Swift for iOS integration). The app aims to provide a clean, maintainable structure with clear naming for files and classes.

## Tools and Technologies

- Dart
- Flutter SDK
- Swift (iOS platform-specific code, where applicable)
- Android Studio / Xcode
- Git
- Common packages: see pubspec.yaml (examples: http, provider/riverpod, shared_preferences)

## Project Structure (recommended and reflected in this repo)

- android/                — Android project files (native integration)
- ios/                    — iOS project files (may include Swift bridging/implementation)
- lib/                    — Main Dart/Flutter source code (keep features in subfolders: lib/features/, lib/widgets/, lib/services/)
- assets/                 — Images, fonts and other static assets
- screenshots/            — App screenshots (place final images here as: screenshot1.png, screenshot2.png, screenshot3.png)
- test/                   — Unit and widget tests
- pubspec.yaml            — Flutter/Dart package manifest
- README.md               — This file

Naming conventions and organization:
- Use clear, descriptive class and file names, e.g. HomeScreen, login_repository.dart, user_service.dart
- Organize features by folder: lib/features/auth/, lib/features/home/, etc.
- Keep widgets reusable in lib/widgets/ and services in lib/services/

## How to run

1. Install Flutter: https://flutter.dev
2. Run flutter doctor and resolve any missing dependencies.
3. From the project root:

```bash
flutter pub get
flutter run
```

To run on a specific device:

```bash
flutter devices
flutter run -d <device-id>
```

## Building release artifacts

- Android APK:

```bash
flutter build apk --release
```

- Android App Bundle:

```bash
flutter build appbundle --release
```

- iOS (from macOS with Xcode):

```bash
flutter build ios --release
```

Open ios/Runner.xcworkspace in Xcode to configure signing and capabilities.

## Tests and analysis

- Unit and widget tests:

```bash
flutter test
```

- Static analysis:

```bash
flutter analyze
```

## Screenshots and Design Documentation

After you finish implementing all screens in the app, please take clear screenshots showing each screen and save them to the screenshots/ folder in the project root. The expected filenames are:

- screenshots/screenshot1.png — Primary landing / home screen
- screenshots/screenshot2.png — Example detail / list screen
- screenshots/screenshot3.png — Settings / form screen

Guidelines for screenshots:
- Use device screenshots (no simulator chrome) if possible.
- Use consistent device and orientation for all app screenshots.
- Include captions or brief notes in this README describing what each screenshot shows.

Example Markdown to add under this section after adding images:

![Home Screen](screenshots/screenshot1.png)
*Figure 1 — Home screen showing main dashboard.*

![Detail Screen](screenshots/screenshot2.png)
*Figure 2 — Detail screen with item information.*

![Settings Screen](screenshots/screenshot3.png)
*Figure 3 — Settings screen and forms.*

## Contribution

1. Fork the repository.
2. Create a feature branch: git checkout -b feature/your-feature
3. Commit changes and push.
4. Open a pull request with a clear description and testing steps.

## Common issues

- Missing packages: run flutter pub get
- iOS signing errors: open the project in Xcode and set a valid Team
- Device not found: use flutter devices to confirm attached devices or start an emulator

## License

See LICENSE file if present. If none, add a license such as MIT or Apache-2.0.

---