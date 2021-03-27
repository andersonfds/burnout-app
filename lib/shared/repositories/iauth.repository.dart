import 'package:app/core/models/auth.model.dart';

abstract class IAuthRepository {
  /// Authenticates the current user using
  /// classic credentials
  Future<AuthModel?> authenticate(String? identifier, String? password);

  /// Refreshes the current user using
  /// a refresh Token
  Future<AuthModel?> refresh(String? token);

  /// Gets the previous user logged
  /// in if there's any
  Future<AuthModel?> restore();
}
