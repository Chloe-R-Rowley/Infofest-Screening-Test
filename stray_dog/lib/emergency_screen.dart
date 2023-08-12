import 'package:flutter/material.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _globalKey,
      appBar: AppBar(
        title: const Text("Stray Dogs"),
        backgroundColor: const Color(0xfffffcf3),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x99fbc711),
              // Color(0x66fbc711),
              Color(0x1Afbc711),
              Color(0x1Afbc711),
              Color(0x1Afbc711),
            ],
          ),
        ),
      ),
    );
  }
}
