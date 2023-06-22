# Flutter Url Launcher Plus

- Encrypt and Decrypt strings in flutter with pure Dart code.

## Supported Devices

- Android
- IOS
- WEB
- LINUX
- MACOS
- WINDOWS

## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):

```yaml
dependencies:
  flutter_encrypt_plus:
```

2. Import the package and use it in your Flutter App.

```dart
import 'package:flutter_encrypt_plus/flutter_encrypt_plus.dart';
```

## Example

### Encode String

```
  String encodedString = encrypt.encodeString("string", "salt");
```

### Decode String

```
  String decodeString = encrypt.decodeString("encodedString", "salt");
```

### Test Package
```
  bool result = encrypt.testPackage();
```

## Next Goals

- [ ] More features to be added

## Contributions

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an issue. <br>
<br>
If you fixed a bug or implemented a feature, please send a pull request.
