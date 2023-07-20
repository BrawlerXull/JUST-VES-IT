import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:justvesit/constants/Routes.dart';
import 'package:justvesit/screens/LandingPage/view/LandingPage.dart';
import 'package:justvesit/screens/loginpage/view/LoginPage.dart';
import 'package:justvesit/screens/signuppage/view/SignupPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const LandingPage(),
      initialRoute: initialPage,
      getPages: pages,
    );
  }
}
