import 'package:app/pages/activity/controllers/activity.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityPage extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => Text(controller.activities.length.toString())),
    );
  }
}
