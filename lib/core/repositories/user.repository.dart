import 'package:app/core/config/environment.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:app/core/models/dto/create_user.dto.dart';
import 'package:app/core/models/base/base.model.dart';
import 'package:app/core/repositories/base/network.repository.dart';
import 'package:app/shared/repositories/iuser.repository.dart';

class UserRepository extends NetworkRepository implements IUserRepository {
  UserRepository() : super(apiUrl: Environment.apiUrl);

  @override
  Future<ValidationModel> create(CreateUserDto user) async {
    final response = await httpClient.post('user', body: user.asMap());

    return response.body;
  }

  @override
  BaseModel get model => ValidationModel();
}
