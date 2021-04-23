import 'package:app/core/models/dto/create_user.dto.dart';
import 'package:app/core/models/user.model.dart';
import 'package:app/core/models/validation.model.dart';
import 'package:app/core/services/base/base.service.dart';
import 'package:app/shared/repositories/iuser.repository.dart';
import 'package:app/shared/services/services.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class UserService extends BaseService implements IUserService {
  final IUserRepository _userRepository = Get.find();

  @override
  Future<Either<ValidationModel, UserModel>> create(CreateUserDto user) {
    return _userRepository.create(user);
  }

  @override
  Future<int?> getBalance() {
    return _userRepository.getBalance();
  }
}
