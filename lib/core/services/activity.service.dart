import 'package:app/core/models/activity/activity.model.dart';
import 'package:app/core/models/activity/activity_list.dart';
import 'package:app/shared/repositories/iactivity.repository.dart';
import 'package:app/shared/services/services.dart';
import 'package:get/get.dart';

import 'base/base.service.dart';

class ActivityService extends BaseService implements IActivityService {
  final IActivityRepository _repository = Get.find();

  @override
  Future<List<ActivityModel>?> getAll() {
    return _repository.getAll();
  }

  @override
  Future<ActivityList?> downloadActivity() {
    return _repository.downloadActivity();
  }

  @override
  Future<void> triggerActivity(int? id) async {
    if (id == null) return;
    final activity = await downloadActivity();
    final first =
        activity?.values?.firstWhere((e) => e?.id == id, orElse: () => null);
    if (first?.startPage.isNotEmpty == true) {
      Get.offNamedUntil(
        first!.startPage,
        (route) => route.settings.name == 'home',
        arguments: first,
      );
    }
  }
}
