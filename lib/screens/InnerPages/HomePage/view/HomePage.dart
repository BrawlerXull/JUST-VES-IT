import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/customClass/TaskDataClass.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';
import 'package:justvesit/screens/InnerPages/HomePage/controller/HomePageController.dart';
import 'package:justvesit/screens/InnerPages/MainPage/controller/MainPageController.dart';
import 'package:justvesit/widgets/DatePickerHomePage.dart';
import 'package:justvesit/widgets/HomePageUpcomingTaskTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.put(HomePageController());
    final GlobalController globalController = Get.put(GlobalController());
    final MainPageController mainPageController = Get.put(MainPageController());
    return Scaffold(
      backgroundColor: kBGColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    gradCap,
                    height: 80.0,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Hello, ${globalController.name.value}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 163, 126, 243),
                          width: 2.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Upcoming Tasks",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            HomePageUpcomingTaskTile(
                                subject: globalController.tasks[0].subjectName,
                                task: globalController.tasks[0].task,
                                date: globalController.tasks[0].date),
                            const SizedBox(
                              height: 15,
                            ),
                            HomePageUpcomingTaskTile(
                                subject: globalController.tasks[1].subjectName,
                                task: globalController.tasks[1].task,
                                date: globalController.tasks[1].date),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              child: const Text(
                                "See more ...",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 163, 126, 243)),
                              ),
                              onTap: () {
                                mainPageController.selectedIndex.value = 1;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
              Visibility(
                visible: globalController.isAdmin.value,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 163, 126, 243),
                            width: 2.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              TextFormField(
                                onChanged: (value) {
                                  homePageController.subject.value = value;
                                },
                                style: const TextStyle(color: kAuthThemeColor),
                                cursorColor: kAuthThemeColor,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: "Subject",
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 163, 126, 243)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 163, 126, 243)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 163, 126, 243)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              TextFormField(
                                onChanged: (value) {
                                  homePageController.description.value = value;
                                },
                                style: const TextStyle(color: kAuthThemeColor),
                                cursorColor: kAuthThemeColor,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: "Description",
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 163, 126, 243)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 163, 126, 243)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 163, 126, 243)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              DatePickerHomePage(),
                              ElevatedButton(
                                onPressed: () async {
                                  TaskDataClass taskData = TaskDataClass(
                                      date: homePageController.date.value,
                                      subjectName:
                                          homePageController.subject.value,
                                      task: homePageController.subject.value);
                                  globalController.tasks.add(taskData);

                                  const String url = kSendApiUrl;
                                  try {
                                    Map<String, dynamic> data = {
                                      "subject":
                                          homePageController.subject.value,
                                      "description":
                                          homePageController.description.value,
                                      "date": homePageController.date.value
                                          .toIso8601String()
                                    };
                                    final response = await http.post(
                                      Uri.parse(url),
                                      headers: {
                                        'Content-Type': 'application/json',
                                      },
                                      body: jsonEncode(data),
                                    );
                                    print(response.statusCode);

                                    if (response.statusCode == 200) {
                                      print('POST request successful!');
                                    } else {
                                      Get.snackbar("error", response.body);
                                    }
                                  } catch (error) {
                                    print('Error sending POST request: $error');
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 158, 49, 177)),
                                ),
                                child: const Text(
                                  "Add the task",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
