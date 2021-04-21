import 'package:app/core/models/dto/create_auth.dto.dart';
import 'package:app/core/models/models.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:app/shared/repositories/repositories.dart';
import 'package:app/shared/services/services.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'base/base.service.dart';

class AuthService extends BaseService implements IAuthService {
  final IAuthRepository _authRepository = Get.find();
  final GetStorage box = Get.find();

  @override
  Future<Either<ValidationModel, AuthModel?>> authenticate(
      CreateAuthDto authDto) async {
    // Making a request to the authentication repository
    final result = await _authRepository.authenticate(authDto);
    // saving on the local storage
    result.fold((l) => null, (r) => box.write('user', r?.asMap()));
    // returning the result
    return result;
  }

  @override
  AuthModel? getCurrentUser() {
    final data = box.read<Map<String, dynamic>>('user');
    return AuthModel().fill(data);
  }
}
