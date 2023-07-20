import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:justvesit/constants/BottomNavBarConstants.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/screens/InnerPages/MainPage/controller/MainPageController.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainPageController _controller = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: bottomNavScreens[_controller.selectedIndex.value],
      ),
      backgroundColor: kBGColor,
      bottomNavigationBar: GNav(
        selectedIndex: _controller.selectedIndex.value,
        onTabChange: (value) {
          _controller.changeSelectedIndex(value);
        },
        tabs: tabs,
        activeColor: Colors.white,
        color: Colors.white60,
      ),
    );
  }
}
