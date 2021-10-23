import 'package:app/core/models/activity/activity.model.dart';
import 'package:app/core/models/activity/activity_list.dart';
import 'package:app/core/models/base/activity_base.dart';
import 'package:app/shared/repositories/iactivity.repository.dart';
import 'package:app/shared/services/services.dart';
import 'package:get/get.dart';

import 'base/base.service.dart';

class ActivityService extends BaseService implements IActivityService {
  final Map<String?, dynamic> _data = {};
  final IActivityRepository _repository = Get.find();
  StepList? cachedSteps;

  @override
  Future<List<ActivityModel>?> getAll() {
    return _repository.getAll();
  }

  @override
  Future<StepList?> downloadActivity(String? id) async {
    if (id != null && cachedSteps?.id == id) {
      return cachedSteps;
    }
    final cache = await _repository.downloadActivity(id);
    cachedSteps = cache;
    return cache;
  }

  @override
  Future<void> handleAction(String action, StepBase? step) async {
    if (step?.startPage != null) {
      Get.offNamedUntil(
        step!.startPage,
        (route) => route.settings.name == '/home',
        arguments: step,
      );
    }
  }

  @override
  Future<void> startActivity(String? id) async {
    _data.clear();
    final steps = await downloadActivity(id);
    if (steps?.values?.isNotEmpty == true) {
      await handleAction('continue', steps?.first);
    }
  }

  @override
  Future<void> next(StepBase? current,
      [String? action = 'continue', dynamic data]) async {
    if (action == 'back') {
      Get.back();
      return;
    }
    if (data != null) {
      _data.addAll({current?.id: data});
    }
    final index = cachedSteps?.values?.indexOf(current);
    if (index != null && index >= 0) {
      final newIndex = index + 1;
      if (newIndex < cachedSteps!.values!.length) {
        final newItem = cachedSteps!.values![newIndex];
        await handleAction(action ?? 'continue', newItem);
      } else {
        final step = await calculateResult();
        final page = step?.startPage;
        if (page != null) {
          Get.offNamedUntil(
            step!.startPage,
            (route) => route.settings.name == '/home',
            arguments: step,
          );
        } else
          Get.back();
      }
    }
  }

  @override
  Future<bool> unlock(String? id) {
    return _repository.unlock(id);
  }

  @override
  Future<StepBase?> calculateResult() async {
    return await _repository.calculateResult(_data);
  }
}
