import 'package:app/core/models/auth.model.dart';
import 'package:app/core/models/dto/create_auth.dto.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  /// Authenticates the current user using
  /// classic credentials
  Future<Either<ValidationModel, AuthModel?>> authenticate(
      CreateAuthDto authDto);

  /// Refreshes the current user using
  /// a refresh Token
  Future<Either<ValidationModel, AuthModel?>> refresh(String? token);

  /// Gets the previous user logged
  /// in if there's any
  Future<Either<ValidationModel, AuthModel?>> restore();
}
