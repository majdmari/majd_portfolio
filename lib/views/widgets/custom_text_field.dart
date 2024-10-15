import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
       this.controller,
       this.maxLines=1,
       this.hintText});

  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(
        color: CustomColors.scaffoldBg,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: CustomColors.whiteSecondary,
        focusedBorder: getInputBorder(),
        enabledBorder: getInputBorder(),
        border: getInputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: CustomColors.hintDark,
        ),
      ),
    );
  }

  OutlineInputBorder getInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }
}
