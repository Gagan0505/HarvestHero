import 'package:flutter/material.dart';
import 'package:harvest_hero/screens/home_screen.dart'; 
import 'package:harvest_hero/screens/home_screen2.dart';
import 'package:harvest_hero/screens/home_screen3.dart';
import 'package:harvest_hero/screens/home_screen4.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Your Crop"),
        backgroundColor: const Color(0xFF6FAA2D),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen2()),
              );
            },
            child: Image.asset('assets/images/apple.png', width: 100, height: 100),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: Image.asset('assets/images/potato.png', width: 100, height: 100),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen3()),
              );
            },
            child: Image.asset('assets/images/maize.png', width: 100, height: 100),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen4()),
              );
            },
            child: Image.asset('assets/images/Tomato.png', width: 100, height: 100),
          ),
        ],
      ),
    );
  }
}
