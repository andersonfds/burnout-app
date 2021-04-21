import 'package:app/core/models/dto/create_auth.dto.dart';
import 'package:app/core/models/models.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:app/shared/repositories/repositories.dart';
import 'package:app/shared/services/services.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'base/base.service.dart';

class AuthService extends BaseService implements IAuthService {
  final IAuthRepository _authRepository = Get.find();

  @override
  Future<Either<ValidationModel, AuthModel?>> authenticate(
      CreateAuthDto authDto) async {
    // Making a request to the authentication repository
    return await _authRepository.authenticate(authDto);
  }
}
