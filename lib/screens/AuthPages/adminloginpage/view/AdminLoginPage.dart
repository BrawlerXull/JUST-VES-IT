import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
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
    Future<void> sendPostRequest() async {}

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
                  onPressed: () async {
                    const String url = kAuthApiUrl;

                    Map<String, dynamic> data = {
                      "username": adminPageController.email.value,
                      "password": adminPageController.password.value
                    };

                    try {
                      final response = await http.post(
                        Uri.parse(url),
                        headers: {
                          'Content-Type': 'application/json',
                        },
                        body: jsonEncode(data),
                      );

                      if (response.statusCode == 200) {
                        print('POST request successful!');
                        final responseData = jsonDecode(response.body);
                        print(responseData["resp"]);
                        if (responseData["resp"] is List &&
                            responseData["resp"].isEmpty) {
                          Get.snackbar("Error", "Wrong email/password");
                        } else {
                          globalController.isAdmin.value = true;
                          Get.toNamed('/mainpage');
                        }
                      } else {
                        print(
                            'POST request failed with status: ${response.statusCode}');
                      }
                    } catch (error) {
                      print('Error sending POST request: $error');
                    }
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
