import 'package:app/shared/services/iuser.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmController extends GetxController {
  IUserService _userService = Get.find();
  Rx<String?> code = Rx(null);
  String? email;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is String) email = args;
  }

  onConfirm() async {
    if (email != null) {
      final result = await _userService.verify(email!, code.value ?? '');
      if (result == true)
        onSucess();
      else
        onFailure();
    }
  }

  onResend() {
    if (email != null) {
      _userService.resend(email!);
    }
  }

  onSucess() {
    Get.offAllNamed('login');
  }

  onFailure() {
    Get.dialog(
      AlertDialog(
        title: Text('Erro ao validar código'),
        content: Text('Código inválido'),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }
}
