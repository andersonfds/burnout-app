import 'package:app/core/config/environment.dart';
import 'package:app/core/models/user.model.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:app/core/models/dto/create_user.dto.dart';
import 'package:app/core/models/base/base.model.dart';
import 'package:app/core/repositories/base/network.repository.dart';
import 'package:app/shared/repositories/iuser.repository.dart';
import 'package:dartz/dartz.dart';

class UserRepository extends NetworkRepository implements IUserRepository {
  UserRepository() : super(apiUrl: Environment.apiUrl);

  @override
  Future<Either<ValidationModel, UserModel>> create(CreateUserDto user) async {
    final response = await httpClient.post('user', body: user.asMap());

    if (response.isOk) {
      return Right(UserModel().fill(response.body));
    }

    return Left(ValidationModel().fill(response.body));
  }

  @override
  BaseModel get model => UserModel();
}
