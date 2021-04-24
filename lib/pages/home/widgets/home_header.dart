import 'package:app/core/models/user.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  final UserModel? user;

  const HomeHeader({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Olá, ${user?.firstName}',
                style: Get.textTheme?.headline5?.apply(
                  color: Get.theme?.primaryColor,
                ),
                maxLines: 1,
              ),
            ),
            CircleAvatar(
              backgroundColor: Get.theme?.primaryColor,
              child: Text('${user?.initials}'),
            ),
          ],
        ),
      ),
    );
  }
}
