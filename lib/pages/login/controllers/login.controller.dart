import 'package:app/core/models/dto/create_auth.dto.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:app/shared/repositories/iauth.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<CreateAuthDto> authDto = Rx(CreateAuthDto());
  RxBool isLoading = false.obs;
  Rx<ValidationModel?> errors = Rx(null);
  final IAuthRepository _authRepository = Get.find();

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

  String? emailError(String? input) =>
      errors.value?.getError('identifier')?.value?.first;

  String? passwordError(String? input) =>
      errors.value?.getError('password')?.value?.first;

  onLogin() async {
    errors.value = null;
    isLoading.value = true;
    authDto.refresh();
    final response = await _authRepository.authenticate(authDto.value);
    isLoading.value = false;
    response.fold((l) {
      errors.value = l;
      errors.refresh();
      authDto.refresh();
    }, (r) => null);
  }
}
