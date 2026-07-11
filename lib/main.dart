import 'package:flutter/material.dart';
import 'game_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          ),
          child: Text('Start Game', style: TextStyle(fontSize: 24)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GamePage()),
            );
          },
        ),
      ),
    );
  }
}
