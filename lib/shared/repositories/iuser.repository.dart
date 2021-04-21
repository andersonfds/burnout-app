import 'package:app/core/models/dto/create_user.dto.dart';
import 'package:app/core/models/validation.model.dart';

abstract class IUserRepository {
  Future<ValidationModel> create(CreateUserDto user);
}
