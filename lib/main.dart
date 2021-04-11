import 'package:flutter/material.dart';

import './screens/generate_key_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subcipher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[700],
        accentColor: Colors.blue[800],
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => GenerateKeyScreen(),
      },
    );
  }
}
