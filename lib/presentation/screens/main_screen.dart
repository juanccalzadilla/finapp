import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
   
  const MainScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ]),
      body: const Center(
         child: Text('MainScreen'),
      ),
    );
  }
}