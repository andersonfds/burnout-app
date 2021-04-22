import 'package:app/pages/signup/controllers/signup.controller.dart';
import 'package:get/get.dart';

class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}
