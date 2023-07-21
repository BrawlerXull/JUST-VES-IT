import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePageUpcomingTaskTile extends StatefulWidget {
  final String subject;

  const HomePageUpcomingTaskTile({required this.subject, Key? key})
      : super(key: key);

  @override
  State<HomePageUpcomingTaskTile> createState() =>
      _HomePageUpcomingTaskTileState();
}

class _HomePageUpcomingTaskTileState extends State<HomePageUpcomingTaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
