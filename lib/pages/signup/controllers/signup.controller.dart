import 'package:app/core/models/dto/create_user.dto.dart';
import 'package:app/core/models/user.model.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:app/shared/services/services.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  IUserService _userService = Get.find();
  Rx<CreateUserDto> userDto = Rx(CreateUserDto());
  Rx<ValidationModel?> errors = Rx(null);
  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;

  onError(ValidationModel validation) {
    errors.value = validation;
    errors.refresh();
  }

  onSuccess(UserModel user) {
    Get.offAllNamed('signup/confirm', arguments: user.email);
  }

  changePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  onSignup() async {
    isLoading.value = true;
    final result = await _userService.create(userDto.value);
    isLoading.value = false;
    result.fold(onError, onSuccess);
  }
}
