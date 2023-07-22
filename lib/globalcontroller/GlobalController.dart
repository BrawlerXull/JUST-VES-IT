import 'package:get/get.dart';
import 'package:justvesit/customClass/TaskDataClass.dart';

class GlobalController extends GetxController {
  RxString name = "Chinmay".obs;
  RxString college = "VESIT".obs;
  RxString branch = "IT".obs;
  RxString div = "D10C".obs;
  RxString email = "chinmay.chaudhari@gmail.com".obs;
  RxString gender = "Male".obs;
  RxBool isAdmin = true.obs;

  RxList<TaskDataClass> tasks = [
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Physics",
      task: "Do the homework",
    ),
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Chemistry",
      task: "Do the homework",
    ),
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Maths",
      task: "Do the homework",
    ),
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Physics",
      task: "Do the homework",
    ),
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Chemistry",
      task: "Do the homework",
    ),
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Maths",
      task: "Do the homework",
    ),
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Physics",
      task: "Do the homework",
    ),
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Chemistry",
      task: "Do the homework",
    ),
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Maths",
      task: "Do the homework",
    ),
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Physics",
      task: "Do the homework",
    ),
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Chemistry",
      task: "Do the homework",
    ),
    TaskDataClass(
      date: DateTime.now(),
      subjectName: "Maths",
      task: "Do the homework",
    ),
  ].obs;
}
