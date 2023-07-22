import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/constants/UpcomingTaskData.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';
import 'package:justvesit/screens/InnerPages/MainPage/controller/MainPageController.dart';
import 'package:justvesit/widgets/CustomTextFormField.dart';
import 'package:justvesit/widgets/HomePageUpcomingTaskTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print(UpcomingTaskData.tasks[0].date);
    final GlobalController globalController = Get.put(GlobalController());
    final MainPageController mainPageController = Get.put(MainPageController());
    return Scaffold(
      backgroundColor: kBGColor,
      body: Center(
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
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 81, 79, 79),
                      borderRadius: BorderRadius.only(
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
                              subject: UpcomingTaskData.tasks[0].subjectName,
                              task: UpcomingTaskData.tasks[0].task,
                              date: UpcomingTaskData.tasks[0].date),
                          SizedBox(
                            height: 15,
                          ),
                          HomePageUpcomingTaskTile(
                              subject: UpcomingTaskData.tasks[1].subjectName,
                              task: UpcomingTaskData.tasks[1].task,
                              date: UpcomingTaskData.tasks[1].date),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            child: Text(
                              "See more ...",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 163, 126, 243)),
                            ),
                            onTap: () {
                              mainPageController.selectedIndex.value = 1;
                            },
                          ),
                          SizedBox(
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
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 81, 79, 79),
                        borderRadius: BorderRadius.only(
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
                              style: const TextStyle(color: kAuthThemeColor),
                              cursorColor: kAuthThemeColor,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: "Add a new task",
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 163, 126, 243)),
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
                            ElevatedButton(
                              onPressed: () {},
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
    );
  }
}
