import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/screens/loginpage/view/LoginPage.dart';
import 'package:justvesit/screens/signuppage/view/SignupPage.dart';
import 'package:justvesit/widgets/RoundedButton.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Align(
            child: SvgPicture.asset(
              "assets/icons/grad_cap.svg",
              height: 150.0,
            ),
          ),
          const Text(
            "JustVesIt",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          const Text(
            "Let's Connect!\nIn A Better Way",
            maxLines: 2,
            style: TextStyle(
              color: Color.fromARGB(255, 240, 203, 89),
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: RoundButton(
              text: 'Sign Up',
              color: kAuthThemeColor,
              textColor: Colors.white,
              onPressed: () {
                Get.toNamed("/signup");
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: RoundButton(
              color: Colors.white,
              text: 'Log In',
              textColor: kAuthThemeColor,
              onPressed: () {
                Get.toNamed("/login");
              },
            ),
          ),
        ],
      ),
    );
  }
}
