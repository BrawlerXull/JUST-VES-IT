import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:justvesit/constants/Constants.dart';

class HomePageUpcomingTaskTile extends StatefulWidget {
  final String subject;
  final DateTime date;
  final String task;

  const HomePageUpcomingTaskTile(
      {required this.subject, required this.task, required this.date, Key? key})
      : super(key: key);

  @override
  State<HomePageUpcomingTaskTile> createState() =>
      _HomePageUpcomingTaskTileState();
}

class _HomePageUpcomingTaskTileState extends State<HomePageUpcomingTaskTile> {
  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('EEEE, d MMMM');
    return Container(
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: kAuthThemeColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            width: 10,
            height: 100,
          ),
          SizedBox(
            width: Get.width * 0.04,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.subject,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.task,
                style: const TextStyle(
                  color: Color.fromARGB(255, 212, 209, 209),
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                dateFormat.format(widget.date.toLocal()),
                style: const TextStyle(
                  color: Color.fromARGB(255, 212, 209, 209),
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
