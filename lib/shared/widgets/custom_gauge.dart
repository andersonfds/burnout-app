import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _CustomGaugePaint extends CustomPainter {
  final double value;
  late Paint backgroundPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 15.0
    ..color = Colors.white10;

  late Paint foregroundPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8.0
    ..strokeCap = StrokeCap.round
    ..color = Colors.yellow;

  _CustomGaugePaint({
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final middle = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(middle, size.width / 2, backgroundPaint);

    final percent = pi * 2 * value;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawArc(rect, -pi / 2, percent, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomGauge extends StatelessWidget {
  final double value = 0.1;
  final double radius = 120;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomGaugePaint(
        value: value,
      ),
      child: Container(
        alignment: Alignment.center,
        width: radius,
        height: radius,
        child: Text(
          '${(value * 100).ceil()}',
          style: Get.textTheme?.headline5,
        ),
      ),
    );
  }
}
