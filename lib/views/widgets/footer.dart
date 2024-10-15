import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Text('Made by Majd Mari with Flutter 3.24.0',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: CustomColors.whiteSecondary,
        ),),
    );
  }
}
