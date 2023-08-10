import 'package:get/get.dart';
import 'package:justvesit/customClass/TaskDataClass.dart';
import 'package:justvesit/customClass/ToDoDataClass.dart';

class GlobalController extends GetxController {
  RxString name = "".obs;
  RxString college = "".obs;
  RxString branch = "".obs;
  RxString div = "".obs;
  RxString email = "".obs;
  RxString gender = "".obs;
  RxBool isAdmin = true.obs;
  RxList<TaskDataClass> tasks = <TaskDataClass>[].obs;
  RxList<ToDoDataClass> todos = <ToDoDataClass>[].obs;
}
