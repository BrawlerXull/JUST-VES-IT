import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:justvesit/screens/InnerPages/HomePage/view/HomePage.dart';
import 'package:justvesit/screens/InnerPages/ProfilePage/view/ProfilePage.dart';
import 'package:justvesit/screens/InnerPages/TaskPage/view/TaskPage.dart';
import 'package:justvesit/screens/InnerPages/ToDoPage/view/TodoPage.dart';

List<GButton> tabs = const [
  GButton(
    icon: Icons.home,
    text: 'Home',
  ),
  GButton(
    icon: Icons.task,
    text: 'Tasks',
  ),
  GButton(
    icon: Icons.check_box,
    text: 'Todo',
  ),
  GButton(
    icon: Icons.person,
    text: 'Profile',
  ),
];

List<Widget> bottomNavScreens = const [
  HomePage(),
  TaskPage(),
  ToDoPage(),
  ProfilePage(),
];
