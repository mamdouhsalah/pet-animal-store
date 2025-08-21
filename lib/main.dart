import 'package:animals/feature/home/model/cat_data.dart';
import 'package:flutter/material.dart';
import 'package:animals/feature/home/view/screen/welcome_screen.dart';

void main() {
  getData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
