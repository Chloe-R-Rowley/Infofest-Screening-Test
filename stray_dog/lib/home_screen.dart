import 'package:flutter/material.dart';
import 'package:stray_dog/emergency_screen.dart';
import 'package:stray_dog/login.dart';
import 'package:stray_dog/drawer.dart';
import 'package:stray_dog/spot_stray_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {required this.onItemTapped, required this.selectedIndex, super.key});
  final void Function(int) onItemTapped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _globalKey,
      appBar: AppBar(
        title: const Text("Stray Dogs"),
        backgroundColor: const Color(0x1Afbc711),
      ),
      drawer: DrawerScreen(
          selectedIndex: selectedIndex, onItemTapped: onItemTapped),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Color(0x66fbc711),
              Color(0x1Afbc711),
              Color(0x1Afbc711),
              Color(0x1Afbc711),
              Color(0x99fbc711),
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    "Did you Spot a stray?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const SizedBox(
                    width: 290,
                    child: Text(
                      "Post it on the map in just 1 minute to help its rescue.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SpotStrayScreen()));
                        },
                        child: const Text(
                          "Spot a stray",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff00A6A2),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login(
                                        onItemTapped: onItemTapped,
                                        selectedIndex: selectedIndex)));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmergencyScreen()));
                      },
                      child: const Text("Emergency Alert")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
