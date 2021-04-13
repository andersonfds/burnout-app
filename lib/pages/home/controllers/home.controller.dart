import 'package:app/core/models/activity.model.dart';
import 'package:app/shared/services/iactivity.service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with StateMixin<List<ActivityModel>?> {
  // services
  IActivityService _activityService = Get.find();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.error());
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
