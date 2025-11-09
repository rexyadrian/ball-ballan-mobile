import 'package:flutter/material.dart';
import 'package:ball_ballan/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ball-Ballan Mobile',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(
            primary: Colors.blue[900],
            secondary: Colors.blueAccent[400],
        ),
      ),
      home: MyHomePage(),
    );
  }
}


