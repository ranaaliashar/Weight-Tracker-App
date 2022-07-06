import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weight_tracking_app/utils/colors.dart';

class TextInputField extends StatelessWidget {
  TextEditingController controller;
  IconData icon;
  String labelText;
  bool isObsecure;
   TextInputField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.labelText,
    this.isObsecure =false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelStyle: const TextStyle(fontSize: 20),
        prefixIcon: Icon(icon),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor),
        ),
      ),
      obscureText: isObsecure,
    );
  }
}
