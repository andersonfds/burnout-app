import 'package:get/get.dart';

import '../controllers/login.controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
