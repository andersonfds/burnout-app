import 'package:app/core/models/auth.model.dart';
import 'package:app/shared/repositories/repositories.dart';

import 'base/network.repository.dart';

class AuthRepository extends NetworkRepository<AuthModel>
    implements IAuthRepository {
  @override
  bool enableToken = false;

  @override
  AuthModel get model => AuthModel();

  @override
  Future<AuthModel?> authenticate(String? identifier, String? password) async {
    final response = await httpClient.get<AuthModel>('oauth/session');
    return response.body;
  }

  @override
  Future<AuthModel?> refresh(String? token) {
    throw UnimplementedError();
  }

  @override
  Future<AuthModel?> restore() {
    throw UnimplementedError();
  }
}
