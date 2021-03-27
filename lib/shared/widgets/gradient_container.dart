import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientContainer extends StatelessWidget {
  final Widget? child;

  const GradientContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Get.theme?.primaryColor ?? Colors.transparent,
            Get.theme?.accentColor ?? Colors.transparent,
          ],
        ),
      ),
    );
  }
}
