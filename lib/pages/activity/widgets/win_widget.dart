import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WinWidget extends StatelessWidget {
  final String level = 'Nível 1';

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Lottie.asset(
          'assets/lottie/winner.json',
          repeat: false,
        ),
        Text(
          level,
          style: Get.textTheme.headline3?.apply(
            color: Get.theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
