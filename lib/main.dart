import 'package:flutter/material.dart';

void main() {
  runApp(const CebmedApp());
}

class CebmedApp extends StatelessWidget {
  const CebmedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'Bienvenue sur Cebmed',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}