import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraggableTile extends StatelessWidget {
  final int data;

  const DraggableTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Draggable<int>(
        data: data,
        axis: Axis.vertical,
        feedback: Container(
          width: 150,
          height: 60,
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            color: Get.theme.primaryColor.withOpacity(0.05),
          ),
        ),
        childWhenDragging: Material(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white.withOpacity(0.02),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 5,
            ),
          ),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(16.0),
          color: Get.theme.primaryColor.withOpacity(0.05),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'hello world',
              style: Get.textTheme.subtitle1?.apply(
                color: Get.theme.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
