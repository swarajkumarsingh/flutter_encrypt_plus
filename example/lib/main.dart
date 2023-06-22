import 'package:flutter/material.dart';
import 'package:flutter_encrypt_plus/flutter_encrypt_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// [encodeString] - pass the INPUT with the salt and obtain the DECRYPTED INPUT
  void encryptKey() {
    debugPrint(encrypt.encodeString("<INPUT>", "<SALT>"));
  }

  /// [decodeString] - pass the DECRYPTED INPUT with the salt and obtain the real text
  void decryptKey() {
    encrypt.decodeString("<DECRYPTED INPUT>", "<SALT>");
  }

  /// [testPackage] - Return true or false based on the test results
  void testPackage() {
    encrypt.testPackage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text("Encrypt and Decrypt and String Value"),
              ElevatedButton.icon(
                onPressed: encryptKey,
                icon: const Icon(Icons.no_encryption),
                label: const Text("Encrypt"),
              ),
              ElevatedButton.icon(
                onPressed: decryptKey,
                icon: const Icon(Icons.no_encryption),
                label: const Text("Decrypt"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
