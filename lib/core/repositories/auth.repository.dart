import 'package:app/core/config/environment.dart';
import 'package:app/core/models/auth.model.dart';
import 'package:app/core/models/dto/create_auth.dto.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:app/shared/repositories/repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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
    final request = authDto.asMap();
    // Adding firebase token of the device
    final firebaseToken = await FirebaseMessaging.instance.getToken();

    request.addAll({'deviceId': firebaseToken});

    // authenticating
    final response = await httpClient.post('auth/session', body: request);

    if (response.isOk)
      // if success return the object
      return Right(AuthModel().fill(response.body));

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
