import 'dart:async';
import 'package:flutter/material.dart';
import 'package:harvest_hero/screens/model_screen.dart';
// import 'package:harvest_hero/screens/navigation.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ModelScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6FAA2D),
      body: SafeArea(
        child: Container(
          color: const Color(0xFF6FAA2D),
          child: Center(
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
        ),
      ),
    );
  }
}
