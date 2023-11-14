import 'package:flutter/material.dart';
import 'package:flutter_application_2/splash.dart';

const SAVE_KEY_NAME = 'userloggedIn';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 29, 85, 111)),
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}
