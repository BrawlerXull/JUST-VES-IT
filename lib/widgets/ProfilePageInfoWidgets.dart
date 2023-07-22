import 'package:flutter/material.dart';
import 'package:justvesit/constants/Constants.dart';

class ProfilePageInfoWidgets extends StatelessWidget {
  final String title;
  final String info;

  const ProfilePageInfoWidgets({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          title,
          style: const TextStyle(
              color: Color.fromARGB(255, 241, 162, 255), fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          info,
          style: const TextStyle(
              color: Color.fromARGB(255, 230, 222, 222), fontSize: 15),
        ),
      ],
    );
  }
}
