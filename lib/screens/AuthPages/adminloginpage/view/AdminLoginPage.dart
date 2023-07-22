import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';
import 'package:justvesit/screens/AuthPages/adminloginpage/controller/AdminPageController.dart';
import 'package:justvesit/widgets/CustomTextFormField.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  @override
  Widget build(BuildContext context) {
    final AdminPageController adminPageController =
        Get.put(AdminPageController());
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
                      text: "Email",
                      onChanged: (value) {
                        adminPageController.email.value = value;
                      },
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    CustomTextFormField(
                      text: "Password",
                      onChanged: (value) {
                        adminPageController.password.value = value;
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    print(adminPageController.email.value);
                    print(adminPageController.password.value);
                    globalController.isAdmin.value = true;

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
