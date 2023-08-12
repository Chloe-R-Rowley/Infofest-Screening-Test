import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  final void Function(int) onItemTapped;
  const DrawerScreen(
      {required this.selectedIndex, required this.onItemTapped, super.key});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Stray Dogs'),
          ),
          ListTile(
            title: const Text('Home'),
            selected: selectedIndex == 0,
            onTap: () {
              // Update the state of the app
              onItemTapped(0);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Business'),
            selected: selectedIndex == 1,
            onTap: () {
              // Update the state of the app
              onItemTapped(1);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('School'),
            selected: selectedIndex == 2,
            onTap: () {
              // Update the state of the app
              onItemTapped(2);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
