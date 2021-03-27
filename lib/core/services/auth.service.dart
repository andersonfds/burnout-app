import 'package:app/core/models/models.dart';
import 'package:app/shared/repositories/repositories.dart';
import 'package:app/shared/services/services.dart';
import 'package:get/get.dart';

import 'base/base.service.dart';

class AuthService extends BaseService implements IAuthService {
  final IAuthRepository _authRepository = Get.find();

  @override
  Future<AuthModel?> authenticate(String? identifier, String? password) async {
    // Making a request to the authentication repository
    return await _authRepository.authenticate(identifier, password);
  }
}
