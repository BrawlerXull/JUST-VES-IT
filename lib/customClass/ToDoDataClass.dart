import 'dart:ffi';

class ToDoDataClass {
  String subjectName;
  DateTime date;
  String task;
  String id;
  Bool done;
  ToDoDataClass(
      {required this.subjectName,
      required this.task,
      required this.date,
      required this.id,
      required this.done});
}
