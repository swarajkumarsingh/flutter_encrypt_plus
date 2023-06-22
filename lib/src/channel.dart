import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_encrypt_plus/src/messages.dart';

final channel = _Channel();

class _Channel {
  String encodeString(String input, String salt) {
    const utf8Encoder = Utf8Encoder();
    final encodedSalt = utf8Encoder.convert(salt);
    final encodedInput = utf8Encoder.convert(input);

    final saltBytes = Uint8List.fromList(encodedSalt);
    final inputBytes = Uint8List.fromList(encodedInput);

    final combinedBytes = Uint8List(saltBytes.length + inputBytes.length);

    try {
      combinedBytes.setAll(0, saltBytes);
      combinedBytes.setAll(saltBytes.length, inputBytes);

      for (var i = 0; i < inputBytes.length; i++) {
        final saltIndex = i % saltBytes.length;
        final saltByte = saltBytes[saltIndex];

        combinedBytes[saltBytes.length + i] ^= saltByte;
      }
    } catch (e, stackTrace) {
      message.throwError(e: e, stackTrace: stackTrace);
    }

    return base64Url.encode(combinedBytes);
  }

  String decodeString(String encodedString, String salt) {
    final combinedBytes = base64Url.decode(encodedString);
    final saltBytes = Uint8List.fromList(utf8.encode(salt));

    try {
      for (var i = 0; i < combinedBytes.length - saltBytes.length; i++) {
        final saltIndex = i % saltBytes.length;
        final saltByte = saltBytes[saltIndex];

        combinedBytes[saltBytes.length + i] ^= saltByte;
      }
    } catch (e, stackTrace) {
      message.throwError(e: e, stackTrace: stackTrace);
    }

    final inputBytes = combinedBytes.sublist(saltBytes.length);
    final decodedInput = utf8.decode(inputBytes);

    return decodedInput;
  }

  bool testPackage() {
    String string = "THIS IS A STRING";
    String salt = "my_salt";

    String eS = encodeString(string, salt);
    String dS = decodeString(eS, salt);

    return string == dS;
  }
}
