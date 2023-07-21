import 'package:flutter/material.dart';

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
              color: Color.fromARGB(153, 149, 139, 139), fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          info,
          style: TextStyle(color: Colors.white60, fontSize: 15),
        ),
      ],
    );
  }
}
