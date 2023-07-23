import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/constants/CustomFunctions.dart';
import 'package:justvesit/widgets/RoundedButton.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    CustomFunction.fetchAllTasks();
  }

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
              gradCap,
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: RoundButton(
              text: 'Admin Login',
              color: kAuthThemeColor,
              textColor: Colors.white,
              onPressed: () {
                Get.toNamed("/adminlogin");
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: RoundButton(
              color: Colors.white,
              text: 'Guest Login',
              textColor: kAuthThemeColor,
              onPressed: () {
                Get.toNamed("/guestlogin");
              },
            ),
          ),
        ],
      ),
    );
  }
}
