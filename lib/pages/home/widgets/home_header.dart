import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  final String name;

  const HomeHeader({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Olá, $name',
              style: Get.textTheme?.headline5?.apply(
                color: Get.theme?.primaryColor,
              ),
              maxLines: 1,
            ),
          ),
          CircleAvatar(
            backgroundColor: Get.theme?.primaryColor,
            child: Text(name[0]),
          ),
        ],
      ),
    );
  }
}
