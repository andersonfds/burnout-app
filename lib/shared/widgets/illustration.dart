import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Illustration extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;

  const Illustration({
    Key? key,
    required this.name,
    this.width,
    this.height,
  }) : super(key: key);

  factory Illustration.name(String name, {double? width, double? height}) =>
      Illustration(
        name: name,
        width: width,
        height: height,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset('assets/vectors/$name.svg'),
    );
  }
}
