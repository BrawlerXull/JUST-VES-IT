import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/screens/InnerPages/HomePage/controller/HomePageController.dart';

class DatePickerHomePage extends StatefulWidget {
  const DatePickerHomePage({Key? key}) : super(key: key);

  @override
  State<DatePickerHomePage> createState() => _DatePickerHomePageState();
}

class _DatePickerHomePageState extends State<DatePickerHomePage> {
  final HomePageController homePageController = Get.put(HomePageController());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      homePageController.date.value = picked;
    } else {
      Get.snackbar("Error", "Selected date");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kAuthThemeColor),
          ),
          onPressed: () => _selectDate(context),
          child: const Text(
            'Select Date',
          ),
        ),
      ],
    );
  }
}
