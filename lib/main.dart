import 'package:flutter/material.dart';
import 'package:ifin_poc/screens/documents_screen.dart';
import 'package:ifin_poc/screens/home_screen.dart';
import 'package:ifin_poc/screens/liveness_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4838E7)),
      ),
      home: const HomeScreen(),
    );
  }
}


