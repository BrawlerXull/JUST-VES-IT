import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/customClass/TaskDataClass.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';
import 'package:justvesit/screens/InnerPages/HomePage/controller/HomePageController.dart';

class CustomFunction {
  static final GlobalController globalController = Get.put(GlobalController());
  static final HomePageController homePageController =
      Get.put(HomePageController());

  static void fetchAllTasks() async {
    try {
      const String url = kAllApiUrl;
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

  static void deleteTheTask(String id) async {
    try {
      Map<String, dynamic> data = {
        "_id": id,
      };
      final response = await http.post(
        Uri.parse(kDeleteApiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        print('POST request successful!');

        CustomFunction.fetchAllTasks();
        Get.snackbar(
            "Confirmation", "Your task has been successfully deleted.");
      } else {
        Get.snackbar("error", response.body);
      }
    } catch (error) {
      print('Error sending POST request: $error');
    }
  }

  static void addTheTask() async {
    TaskDataClass taskData = TaskDataClass(
        id: homePageController.id.value,
        date: homePageController.date.value,
        subjectName: homePageController.subject.value,
        task: homePageController.subject.value);
    globalController.tasks.add(taskData);

    const String url = kSendApiUrl;
    try {
      Map<String, dynamic> data = {
        "subject": homePageController.subject.value,
        "description": homePageController.description.value,
        "date": homePageController.date.value.toIso8601String()
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
        Get.snackbar("Confirmation", "Your task has been successfully added.");
      } else {
        Get.snackbar("error", response.body);
      }
    } catch (error) {
      print('Error sending POST request: $error');
    }
  }

  static void updateTasksFromResponse(List<dynamic> response) {
    List<TaskDataClass> updatedTasks = response.map((taskMap) {
      if (taskMap is Map<String, dynamic>) {
        String subjectName = taskMap['subject'] ?? '';
        String task = taskMap['description'] ?? '';
        String id = taskMap['_id'] ?? '';
        DateTime date =
            DateTime.tryParse(taskMap['date'] ?? '') ?? DateTime.now();

        return TaskDataClass(
          id: id,
          subjectName: subjectName,
          task: task,
          date: date,
        );
      } else {
        return TaskDataClass(
          id: '',
          subjectName: '',
          task: '',
          date: DateTime.now(),
        );
      }
    }).toList();
    globalController.tasks.assignAll(updatedTasks);
    sortTasksByDate();
  }

  static void sortTasksByDate() {
    globalController.tasks.sort((a, b) => a.date.compareTo(b.date));
  }
}
