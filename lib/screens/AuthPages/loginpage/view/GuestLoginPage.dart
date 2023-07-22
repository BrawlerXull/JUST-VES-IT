import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';
import 'package:justvesit/screens/AuthPages/loginpage/controller/GuestLoginPageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/widgets/CustomTextFormField.dart';

class GuestLoginPage extends StatefulWidget {
  const GuestLoginPage({super.key});

  @override
  State<GuestLoginPage> createState() => _GuestLoginPageState();
}

class _GuestLoginPageState extends State<GuestLoginPage> {
  @override
  Widget build(BuildContext context) {
    final GuestLoginPageController guestLoginPageController =
        Get.put(GuestLoginPageController());
    final GlobalController globalController = Get.put(GlobalController());
    return Scaffold(
      body: Container(
        color: kBGColor,
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                Column(
                  children: [
                    CustomTextFormField(
                      text: "Name",
                      onChanged: (value) {
                        guestLoginPageController.name.value = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      text: "Branch",
                      onChanged: (value) {
                        guestLoginPageController.branch.value = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      text: "Div",
                      onChanged: (value) {
                        guestLoginPageController.division.value = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      text: "College",
                      onChanged: (value) {
                        guestLoginPageController.college.value = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      text: "Gender",
                      onChanged: (value) {
                        guestLoginPageController.gender.value = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      text: "Email",
                      onChanged: (value) {
                        guestLoginPageController.email.value = value;
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    globalController.name.value =
                        guestLoginPageController.name.value;
                    globalController.email.value =
                        guestLoginPageController.email.value;
                    globalController.college.value =
                        guestLoginPageController.college.value;
                    globalController.branch.value =
                        guestLoginPageController.branch.value;
                    globalController.div.value =
                        guestLoginPageController.division.value;
                    globalController.gender.value =
                        guestLoginPageController.gender.value;

                    globalController.isAdmin.value = false;
                    Get.toNamed('/mainpage');
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                  ),
                  child: const Text(
                    "Let's get in!",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
