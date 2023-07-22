import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:justvesit/constants/Constants.dart';

class DatePickerHomePage extends StatefulWidget {
  const DatePickerHomePage({super.key});

  @override
  State<DatePickerHomePage> createState() => _DatePickerHomePageState();
}

class _DatePickerHomePageState extends State<DatePickerHomePage> {
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kAuthThemeColor)),
          onPressed: () => _selectDate(context),
          child: const Text(
            'Select Date',
          ),
        ),
      ],
    );
  }
}
