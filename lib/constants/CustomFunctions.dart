import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/customClass/TaskDataClass.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';
import 'package:justvesit/screens/InnerPages/HomePage/controller/HomePageController.dart';
import 'package:justvesit/screens/InnerPages/MainPage/controller/MainPageController.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CustomFunction {
  static final GlobalController globalController = Get.put(GlobalController());
  static final HomePageController homePageController =
      Get.put(HomePageController());
  static final MainPageController mainPageController =
      Get.put(MainPageController());

  static Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      homePageController.date.value = picked;
    } else {
      Get.snackbar("Error", "Selected date");
    }
  }

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

  static void logoutButtonClicked() {
    globalController.branch.value = "";
    globalController.name.value = "";
    globalController.email.value = "";
    globalController.college.value = "";
    globalController.div.value = "";
    globalController.gender.value = "";
    mainPageController.selectedIndex.value = 0;

    Get.toNamed('/landing');
  }

  static Future<void> connectToWebSocket() async {
    try {
      final WebSocketChannel channel = IOWebSocketChannel.connect(
        Uri.parse("ws://localhost:5002/"),
      );

      print('WebSocket connection established');

      channel.sink.add('Hello, WebSocket Server!');

      await channel.stream.listen(
        (message) {
          print('Received: $message');
        },
        onError: (error) {
          print('Error: $error');
        },
        onDone: () {
          print('WebSocket closed');
        },
      ).asFuture();
    } catch (e) {
      print('Error: $e');
    }
  }
}
