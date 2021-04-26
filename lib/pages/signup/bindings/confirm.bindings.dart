import 'package:app/pages/signup/controllers/confirm.controller.dart';
import 'package:get/get.dart';

class ConfirmBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ConfirmController());
  }
}
