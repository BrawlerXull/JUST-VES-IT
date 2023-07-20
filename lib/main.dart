import 'package:flutter/material.dart';
import 'package:justvesit/screens/LandingPage/view/LandingPage.dart';
import 'package:justvesit/screens/loginpage/view/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}
