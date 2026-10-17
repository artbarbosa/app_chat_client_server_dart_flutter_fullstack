# Dart and Flutter Chat

Chat study with a Flutter client, a Dart Socket.IO server and a shared package containing message types.

## Structure

- `app_client_flutter/`: Flutter client.
- `server/`: Dart server, started by `server/bin/server.dart`.
- `common/`: shared message types.

## Run locally

This is a historical study. The client declares Dart `>=2.16.0 <3.0.0`; use a compatible Flutter release and consult each package's `pubspec.yaml` before upgrading.

Start the server:

```bash
cd server
dart pub get
dart run bin/server.dart
```

The server uses the `PORT` environment variable or port `3000`. In another terminal, run the client:

```bash
cd app_client_flutter
flutter pub get
flutter run
```

Review the client's server address for the selected emulator or physical device. Tests and package-specific notes are retained in the component directories.
