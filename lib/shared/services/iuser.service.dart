import 'package:app/core/models/dto/create_user.dto.dart';
import 'package:app/core/models/user.model.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:dartz/dartz.dart';

abstract class IUserService {
  Future<Either<ValidationModel, UserModel>> create(CreateUserDto user);

  Future<int?> getBalance();

  Future<bool> verify(String email, String code);

  Future<bool> resend(String email);
}
