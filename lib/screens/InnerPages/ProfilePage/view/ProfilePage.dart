import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.put(GlobalController());
    return Scaffold(
      backgroundColor: kBGColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            child: Text(
                              globalController.name.value,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 30),
                            ),
                          ),
                          ProfilePageInfoWidgets(
                            title: "Email",
                            info: globalController.email.value,
                          ),
                          ProfilePageInfoWidgets(
                            title: "College",
                            info: globalController.college.value,
                          ),
                          ProfilePageInfoWidgets(
                            title: "Branch",
                            info: globalController.branch.value,
                          ),
                          ProfilePageInfoWidgets(
                            title: "Division",
                            info: globalController.div.value,
                          ),
                          ProfilePageInfoWidgets(
                            title: "Gender",
                            info: globalController.gender.value,
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

class ProfilePageInfoWidgets extends StatelessWidget {
  final String title;
  final String info;

  const ProfilePageInfoWidgets({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Color.fromARGB(153, 149, 139, 139), fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          info,
          style: TextStyle(color: Colors.white60, fontSize: 15),
        ),
      ],
    );
  }
}
