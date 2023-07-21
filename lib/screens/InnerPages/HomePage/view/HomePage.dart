import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/constants/UpcomingTaskData.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';
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
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20),
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
                          Text(
                            "See more ...",
                            style: TextStyle(
                                color: Color.fromARGB(255, 163, 126, 243)),
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
          ],
        ),
      ),
    );
  }
}
