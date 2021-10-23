import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WinWidget extends StatelessWidget {
  final int? levelNumber;

  const WinWidget({
    Key? key,
    this.levelNumber,
  }) : super(key: key);

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
          'Nível $levelNumber',
          style: Get.textTheme.headline3?.apply(
            color: Get.theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
