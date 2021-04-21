import 'package:app/core/config/environment.dart';
import 'package:app/core/models/auth.model.dart';
import 'package:app/core/models/dto/create_auth.dto.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:app/shared/repositories/repositories.dart';
import 'package:dartz/dartz.dart';

import 'base/network.repository.dart';

class AuthRepository extends NetworkRepository<AuthModel>
    implements IAuthRepository {
  AuthRepository() : super(apiUrl: Environment.apiUrl);

  @override
  bool enableToken = false;

  @override
  AuthModel get model => AuthModel();

  @override
  Future<Either<ValidationModel, AuthModel?>> authenticate(
      CreateAuthDto authDto) async {
    final response =
        await httpClient.post('auth/session', body: authDto.asMap());

    if (response.isOk)
      // if success return the object
      return Right(decoder(response.body));

    return Left(ValidationModel().fill(response.body));
  }

  @override
  Future<Either<ValidationModel, AuthModel?>> refresh(String? token) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ValidationModel, AuthModel?>> restore() {
    throw UnimplementedError();
  }
}
