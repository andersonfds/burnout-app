import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityTile extends StatelessWidget {
  final bool? selected;

  const ActivityTile({Key? key, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(16.0),
      color:
          Get.theme?.primaryColor.withOpacity(selected == true ? 0.15 : 0.05),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'hello world lorem ipsum dolor sit',
            style: Get.textTheme?.subtitle1?.apply(
              color: Get.theme?.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
