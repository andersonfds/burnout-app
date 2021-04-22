import 'package:app/core/models/auth.model.dart';
import 'package:app/core/models/dto/create_auth.dto.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:app/shared/services/iauth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<CreateAuthDto> authDto = Rx(CreateAuthDto());
  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;
  Rx<ValidationModel?> errors = Rx(null);
  final IAuthService _authService = Get.find();

  @override
  void onInit() {
    super.onInit();
    // Configuring the status bar to be bright
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Get.theme?.canvasColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  String? emailError() => errors.value?.getFirstError('identifier');

  String? passwordError() => errors.value?.getFirstError('password');

  changePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  onError(ValidationModel validation) {
    errors.value = validation;
    authDto.refresh();
  }

  onSuccess(AuthModel? auth) {
    Get.toNamed('home');
  }

  onLogin() async {
    errors.value = null;
    isLoading.value = true;
    authDto.refresh();
    final response = await _authService.authenticate(authDto.value);
    isLoading.value = false;
    response.fold(onError, onSuccess);
  }
}
