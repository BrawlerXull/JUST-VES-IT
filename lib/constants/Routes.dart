import 'package:get/route_manager.dart';
import 'package:justvesit/screens/AuthPages/LandingPage/view/LandingPage.dart';
import 'package:justvesit/screens/AuthPages/adminloginpage/view/AdminLoginPage.dart';
import 'package:justvesit/screens/AuthPages/loginpage/view/GuestLoginPage.dart';
import 'package:justvesit/screens/InnerPages/MainPage/view/MainPage.dart';

String initialPage = "/landing";

List<GetPage> pages = [
  //Inside the Inner screens
  GetPage(
    name: '/mainpage',
    page: () => const MainPage(),
  ),

  //Inside the Auth screens
  GetPage(
    name: '/landing',
    page: () => const LandingPage(),
  ),
  GetPage(
    name: '/guestlogin',
    page: () => const GuestLoginPage(),
  ),
  GetPage(
    name: '/adminlogin',
    page: () => const AdminLoginPage(),
  ),
];
