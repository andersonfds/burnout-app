import 'package:app/core/models/activity/activity.model.dart';
import 'package:app/core/models/activity/activity_list.dart';
import 'package:app/core/models/base/activity_base.dart';
import 'package:app/shared/repositories/iactivity.repository.dart';
import 'package:app/shared/services/services.dart';
import 'package:get/get.dart';

import 'base/base.service.dart';

class ActivityService extends BaseService implements IActivityService {
  final IActivityRepository _repository = Get.find();
  StepList? cachedSteps;

  @override
  Future<List<ActivityModel>?> getAll() {
    return _repository.getAll();
  }

  @override
  Future<StepList?> downloadActivity(String? id) async {
    if (id != null && cachedSteps?.id == id) {
      print('value cached!');
      return cachedSteps;
    }
    final cache = await _repository.downloadActivity(id);
    cachedSteps = cache;
    return cache;
  }

  @override
  Future<void> handleAction(StepBase? step) async {
    if (step?.startPage != null) {
      Get.offNamedUntil(
        step!.startPage,
        (route) => route.settings.name == 'home',
        arguments: step,
      );
    }
  }

  @override
  Future<void> startActivity(String? id) async {
    final steps = await downloadActivity(id);
    if (steps?.values?.isNotEmpty == true) {
      await handleAction(steps?.first);
    }
  }

  @override
  Future<void> next(StepBase? current) async {
    final index = cachedSteps?.values?.indexOf(current);
    print(index);
    if (index != null && index >= 0) {
      final newIndex = index + 1;
      if (newIndex < cachedSteps!.values!.length) {
        final newItem = cachedSteps!.values![newIndex];
        await handleAction(newItem);
      }
    }
  }
}
