import 'package:app/core/models/auth.model.dart';
import 'package:app/core/models/dto/create_auth.dto.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthService {
  /// Authenticates the user with classic credentials
  /// identifier and password
  Future<Either<ValidationModel, AuthModel?>> authenticate(
      CreateAuthDto authDto);
}
