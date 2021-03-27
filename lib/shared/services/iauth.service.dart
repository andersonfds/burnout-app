import 'package:app/core/models/auth.model.dart';

abstract class IAuthService {
  /// Authenticates the user with classic credentials
  /// identifier and password
  Future<AuthModel?> authenticate(String? identifier, String? password);
}
