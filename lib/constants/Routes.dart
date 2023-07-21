import 'package:get/route_manager.dart';
import 'package:justvesit/screens/AuthPages/LandingPage/view/LandingPage.dart';
import 'package:justvesit/screens/AuthPages/adminloginpage/view/AdminLoginPage.dart';
import 'package:justvesit/screens/AuthPages/loginpage/view/LoginPage.dart';
import 'package:justvesit/screens/InnerPages/MainPage/view/MainPage.dart';

String initialPage = "/mainpage";

List<GetPage> pages = [
  GetPage(
    name: '/mainpage',
    page: () => const MainPage(),
  ),
  GetPage(
    name: '/landing',
    page: () => const LandingPage(),
  ),
  GetPage(
    name: '/guestlogin',
    page: () => const LoginPage(),
  ),
  GetPage(
    name: '/adminlogin',
    page: () => const AdminLoginPage(),
  ),
];
