import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:justvesit/constants/Routes.dart';
import 'package:justvesit/screens/AuthPages/LandingPage/view/LandingPage.dart';

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
