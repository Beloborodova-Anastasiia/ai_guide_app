import 'package:ai_guide/screens/home_screen.dart';
import 'package:flutter/material.dart';


class AiGuide extends StatelessWidget {
  const AiGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Guide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'AU Guide Home Page'),
    );
  }
}

