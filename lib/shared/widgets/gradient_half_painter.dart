import 'package:flutter/material.dart';

class GradientHalfPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.addRRect(
        RRect.fromLTRBR(0.0, 0.0, 100.0, 29.0, Radius.circular(16.0)));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
