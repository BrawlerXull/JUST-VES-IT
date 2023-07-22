import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';
import 'package:justvesit/screens/InnerPages/MainPage/controller/MainPageController.dart';
import 'package:justvesit/widgets/ProfilePageInfoWidgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final MainPageController mainPageController = Get.put(MainPageController());
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
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
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
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 30),
                            ),
                          ),
                          ProfilePageInfoWidgets(
                            title: "Name",
                            info: globalController.name.value,
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
                          const SizedBox(
                            height: 40,
                          ),
                          Align(
                            child: ElevatedButton(
                              onPressed: () {
                                globalController.branch.value = "";
                                globalController.name.value = "";
                                globalController.email.value = "";
                                globalController.college.value = "";
                                globalController.div.value = "";
                                globalController.gender.value = "";
                                mainPageController.selectedIndex.value = 0;

                                Get.toNamed('/landing');
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.purple),
                              ),
                              child: const Text(
                                "Log Out!",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
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
