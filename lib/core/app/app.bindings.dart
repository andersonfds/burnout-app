import 'package:app/core/repositories/repositories.dart';
import 'package:app/core/repositories/user.repository.dart';
import 'package:app/core/services/services.dart';
import 'package:app/shared/repositories/iuser.repository.dart';
import 'package:app/shared/repositories/repositories.dart';
import 'package:app/shared/services/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<GetStorage>(GetStorage());
    // Repositories
    Get.lazyPut<IActivityRepository>(() => ActivityRepository());
    Get.lazyPut<IUserRepository>(() => UserRepository());
    Get.lazyPut<IAuthRepository>(() => AuthRepository());

    // Services
    Get.lazyPut<IActivityService>(() => ActivityService());
    Get.lazyPut<IAuthService>(() => AuthService());
  }
}
