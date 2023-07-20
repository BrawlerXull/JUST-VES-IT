import 'package:get/route_manager.dart';
import 'package:justvesit/screens/LandingPage/view/LandingPage.dart';
import 'package:justvesit/screens/MainPage/view/MainPage.dart';
import 'package:justvesit/screens/loginpage/view/LoginPage.dart';
import 'package:justvesit/screens/signuppage/view/SignupPage.dart';

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
    name: '/login',
    page: () => const LoginPage(),
  ),
  GetPage(
    name: '/signup',
    page: () => const SignupPage(),
  ),
];
