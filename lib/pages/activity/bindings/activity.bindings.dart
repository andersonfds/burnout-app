import 'package:app/pages/activity/controllers/activity.controller.dart';
import 'package:get/get.dart';

class ActivityBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ActivityController());
  }
}
