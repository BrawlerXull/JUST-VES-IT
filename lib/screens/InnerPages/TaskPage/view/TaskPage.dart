import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:justvesit/constants/UpcomingTaskData.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';
import 'package:justvesit/widgets/HomePageUpcomingTaskTile.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.put(GlobalController());
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "Hey ${globalController.name.value}!\nYou have ${UpcomingTaskData.tasks.length} tasks scheduled today",
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
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: UpcomingTaskData.tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: HomePageUpcomingTaskTile(
                    subject: UpcomingTaskData.tasks[index].subjectName,
                    task: UpcomingTaskData.tasks[index].task,
                    date: UpcomingTaskData.tasks[index].date,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
