import 'package:flutter/material.dart';
import 'package:harvest_hero/screens/splash_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Harvest Hero',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), 
    );
  }
}
