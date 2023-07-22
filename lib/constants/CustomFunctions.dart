import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/route_manager.dart';
import 'package:justvesit/customClass/TaskDataClass.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';
import 'package:justvesit/widgets/HomePageUpcomingTaskTile.dart';

class CustomFunction {
  static void fetchAllTasks() async {
    final GlobalController globalController = Get.put(GlobalController());
    try {
      final String url = "http://localhost:5002/all";
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print('GET request successful!');
        final List<dynamic> responseData = jsonDecode(response.body);
        updateTasksFromResponse(responseData);
      } else {
        Get.snackbar("error", response.body);
      }
    } catch (error) {
      print('Error sending GET request: $error');
    }
  }

  static void updateTasksFromResponse(List<dynamic> response) {
    final GlobalController globalController = Get.put(GlobalController());
    List<TaskDataClass> updatedTasks = response.map((taskMap) {
      if (taskMap is Map<String, dynamic>) {
        String subjectName = taskMap['subject'] ?? '';
        String task = taskMap['description'] ?? '';
        DateTime date =
            DateTime.tryParse(taskMap['date'] ?? '') ?? DateTime.now();

        return TaskDataClass(
          subjectName: subjectName,
          task: task,
          date: date,
        );
      } else {
        return TaskDataClass(
          subjectName: '',
          task: '',
          date: DateTime.now(),
        );
      }
    }).toList();
    globalController.tasks.assignAll(updatedTasks);
    print(globalController.tasks[0].task);
  }
}
