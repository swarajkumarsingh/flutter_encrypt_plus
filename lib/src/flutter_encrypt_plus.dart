import 'package:flutter_encrypt_plus/src/channel.dart';

final encrypt = _Encrypt();

class _Encrypt {
  String encodeString(String input, String salt) {
    return channel.encodeString(input, salt);
  }

  String decodeString(String encodedInput, String salt) {
    return channel.decodeString(encodedInput, salt);
  }

  bool testPackage() {
    return channel.testPackage();
  }
}
