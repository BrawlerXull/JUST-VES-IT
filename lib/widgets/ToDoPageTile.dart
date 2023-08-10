import 'package:flutter/material.dart';

class ToDoPageTile extends StatefulWidget {
  final String subject;
  final DateTime date;
  final String task;
  final String id;
  final bool done;

  const ToDoPageTile(
      {required this.subject,
      required this.task,
      required this.date,
      required this.id,
      required this.done});

  @override
  State<ToDoPageTile> createState() => _ToDoPageTileState();
}

class _ToDoPageTileState extends State<ToDoPageTile> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
