import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/route_manager.dart';
import 'package:justvesit/constants/CustomFunctions.dart';
import 'package:justvesit/customClass/TaskDataClass.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';
import 'package:justvesit/widgets/HomePageUpcomingTaskTile.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final GlobalController globalController = Get.put(GlobalController());

  @override
  void initState() {
    super.initState();
    CustomFunction.fetchAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "Hey ${globalController.name.value}!\nYou have ${globalController.tasks.length} tasks scheduled today",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 230, 226, 226),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Obx(
              () => ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: globalController.tasks.length,
                itemBuilder: (context, index) {
                  final task = globalController.tasks[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: HomePageUpcomingTaskTile(
                      subject: task.subjectName,
                      task: task.task,
                      date: task.date,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
