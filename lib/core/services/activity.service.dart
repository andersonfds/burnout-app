import 'package:app/core/models/activity.model.dart';
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
}
