import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/constants/CustomFunctions.dart';
import 'package:justvesit/screens/InnerPages/HomePage/controller/HomePageController.dart';

class DatePickerHomePage extends StatefulWidget {
  const DatePickerHomePage({Key? key}) : super(key: key);

  @override
  State<DatePickerHomePage> createState() => _DatePickerHomePageState();
}

class _DatePickerHomePageState extends State<DatePickerHomePage> {
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kAuthThemeColor),
          ),
          onPressed: () => CustomFunction.selectDate(context),
          child: const Text(
            'Select Date',
          ),
        ),
      ],
    );
  }
}
