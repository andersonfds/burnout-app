import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class CoinIcon extends StatelessWidget {
  final int? coins;
  final Color? color;
  final MainAxisAlignment mainAxisAlignment;

  const CoinIcon({
    Key? key,
    this.coins,
    this.color,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = color ?? Get.theme?.primaryColor;
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesome5Solid.coins,
          color: selectedColor,
        ),
        SizedBox(width: 10),
        Text(
          coins?.toString() ?? '0',
          style: Get.textTheme?.button?.apply(
            color: selectedColor,
            shadows: [
              Shadow(
                offset: Offset(0, 2.0),
                blurRadius: 3.0,
                color: Colors.black54,
              )
            ],
          ),
        ),
      ],
    );
  }
}
