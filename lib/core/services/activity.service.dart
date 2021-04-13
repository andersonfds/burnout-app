import 'package:app/core/models/activity.model.dart';
import 'package:app/core/models/activity_list.dart';
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
  Future<void> triggerActivity(int id) async {
    final activity = await downloadActivity();
    final first = activity?.values?.firstWhere((e) => e.id == id);
    if (first?.startPage != null) {
      Get.offNamedUntil(
        first!.startPage,
        (route) => route.settings.name == 'home',
        arguments: first,
      );
    }
  }
}
