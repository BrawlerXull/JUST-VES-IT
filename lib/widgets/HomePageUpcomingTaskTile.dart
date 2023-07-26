
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/constants/CustomFunctions.dart';
import 'package:justvesit/globalcontroller/GlobalController.dart';

class HomePageUpcomingTaskTile extends StatefulWidget {
  final String subject;
  final DateTime date;
  final String task;
  final String id;

  const HomePageUpcomingTaskTile(
      {required this.subject,
      required this.task,
      required this.date,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  State<HomePageUpcomingTaskTile> createState() =>
      _HomePageUpcomingTaskTileState();
}

class _HomePageUpcomingTaskTileState extends State<HomePageUpcomingTaskTile> {
  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.put(GlobalController());
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
          ),
          const Spacer(),
          Visibility(
            visible: globalController.isAdmin.value,
            child: GestureDetector(
              onTap: () {
                CustomFunction.deleteTheTask(widget.id);
              },
              child: const Icon(
                Icons.delete_forever,
                color: kAuthThemeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
