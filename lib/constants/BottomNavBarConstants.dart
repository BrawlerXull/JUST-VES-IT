import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
  Text(
    'Home',
  ),
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
