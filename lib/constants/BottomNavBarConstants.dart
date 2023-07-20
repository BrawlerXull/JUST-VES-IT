import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:justvesit/screens/InnerPages/HomePage/view/HomePage.dart';

List<GButton> tabs = const [
  GButton(
    icon: Icons.home,
    text: 'Home',
  ),
  GButton(
    icon: Icons.heart_broken,
    text: 'Likes',
  ),
  GButton(
    icon: Icons.search,
    text: 'Search',
  ),
  GButton(
    icon: Icons.person,
    text: 'Profile',
  ),
];

List<Widget> bottomNavScreens = const [
  HomePage(),
  Text(
    'Likes',
  ),
  Text(
    'Search',
  ),
  Text(
    'Profile',
  ),
];
