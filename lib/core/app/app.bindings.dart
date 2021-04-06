import 'package:app/core/repositories/repositories.dart';
import 'package:app/core/services/services.dart';
import 'package:app/shared/repositories/repositories.dart';
import 'package:app/shared/services/services.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.lazyPut<IActivityRepository>(() => ActivityRepository());

    // Services
    Get.lazyPut<IActivityService>(() => ActivityService());
  }
}
