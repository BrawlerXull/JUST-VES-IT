import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justvesit/constants/Constants.dart';
import 'package:justvesit/screens/AuthPages/adminloginpage/controller/AdminPageController.dart';

class CustomTextFormField extends StatefulWidget {
  final String text;
  final Function(String) onChanged;

  const CustomTextFormField({
    required this.text,
    required this.onChanged,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final AdminPageController adminPageController =
      Get.put(AdminPageController());
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    widget.onChanged(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: const TextStyle(color: kAuthThemeColor),
      cursorColor: kAuthThemeColor,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: widget.text,
        labelStyle: const TextStyle(color: Colors.purple),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
      ),
    );
  }
}
