import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:justvesit/constants/Constants.dart';
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
                          topRight: Radius.circular(40)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        const Text(
                          "Upcoming Tasks",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const HomePageUpcomingTaskTile(subject: "Physics"),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                      ],
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
