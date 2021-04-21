import 'package:app/core/models/activity/activity.model.dart';
import 'package:app/core/models/auth.model.dart';
import 'package:app/shared/services/iactivity.service.dart';
import 'package:app/shared/services/iauth.service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with StateMixin<List<ActivityModel>?> {
  // services
  IActivityService _activityService = Get.find();
  IAuthService _authService = Get.find();
  Rx<AuthModel?> user = Rx(null);

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.error());
    getCurrentUser();
  }

  getCurrentUser() {
    user.value = _authService.getCurrentUser();
    user.refresh();
  }

  loadActivities() {
    change(null, status: RxStatus.loading());
    _activityService.getAll().then((value) {
      if (value?.isNotEmpty == true)
        change(value, status: RxStatus.success());
      else
        change(null, status: RxStatus.empty());
    });
  }

  onActivityTap(int? id) {
    if (id != null) {
      _activityService.triggerActivity(id);
    }
  }
}
