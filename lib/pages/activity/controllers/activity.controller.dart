import 'package:app/core/models/base/activity_base.dart';
import 'package:app/shared/services/services.dart';
import 'package:get/get.dart';

class ActivityController extends GetxController {
  final IActivityService _activityService = Get.find();

  // Activities
  RxList<ActivityBase?> activities = RxList([]);

  @override
  void onInit() {
    super.onInit();
    getAllActivities();
  }

  getAllActivities() {
    _activityService
        .downloadActivity()
        .then((value) => activities.addAll(value!.values!));
  }
}
