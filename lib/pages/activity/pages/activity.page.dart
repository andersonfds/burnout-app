import 'package:app/pages/activity/controllers/activity.controller.dart';
import 'package:app/pages/activity/widgets/activity_image.dart';
import 'package:app/pages/activity/widgets/activity_question.dart';
import 'package:app/pages/activity/widgets/activity_selection.dart';
import 'package:app/pages/activity/widgets/activity_text.dart';
import 'package:app/pages/activity/widgets/activity_winner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityPage extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: Get.textTheme,
      ),
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            ActivityImage(),
            ActivityQuestion(),
            ActivitySelection(),
            ActivityText(),
            ActivityWinner(),
          ],
        ),
      ),
    );
  }
}
