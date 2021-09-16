import 'package:app/core/models/auth.model.dart';
import 'package:app/core/models/dto/create_auth.dto.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:app/shared/services/iauth.service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<CreateAuthDto> authDto = Rx(CreateAuthDto());
  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;
  Rx<ValidationModel?> errors = Rx(null);
  final IAuthService _authService = Get.find();

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
    if (auth?.user?.verified == true) {
      Get.offAllNamed('home');
    } else {
      Get.toNamed('signup/confirm', arguments: auth?.user?.email);
    }
  }

  onLogin() async {
    try {
      errors.value = null;
      isLoading.value = true;
      authDto.refresh();
      final response = await _authService.authenticate(authDto.value);
      response.fold(onError, onSuccess);
    } finally {
      isLoading.value = false;
      isLoading.refresh();
      authDto.refresh();
    }
  }
}
