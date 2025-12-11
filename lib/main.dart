import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PatternMakerApp());
}

class PatternMakerApp extends StatelessWidget {
  const PatternMakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pattern Maker Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFa78bfa),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFa78bfa),
          secondary: const Color(0xFF8b5cf6),
        ),
        scaffoldBackgroundColor: const Color(0xFFfef3c7),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
