import 'package:app/core/config/environment.dart';
import 'package:app/core/models/activity/result.activity.dart';
import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/models.dart';
import 'package:app/shared/repositories/repositories.dart';
import 'package:app/shared/utils/utils.dart';

import 'base/network.repository.dart';

class ActivityRepository extends NetworkRepository<ActivityModel>
    implements IActivityRepository {
  ActivityRepository() : super(apiUrl: Environment.apiUrl);

  @override
  Future<List<ActivityModel>?> getAll() async {
    final result = await httpClient.get('activity');
    return ActivityModel().listOf(result.body);
  }

  Future<StepList?> downloadActivity(String? activityId) async {
    final result =
        await httpClient.get('step/$activityId/steps', decoder: (d) => d);
    return StepList.fromJson(activityId, result.body);
  }

  @override
  ActivityModel get model => ActivityModel();

  @override
  Future<bool> unlock(String? id) async {
    final result = await httpClient.post('activity/$id/unlock');
    if (result.isOk) return result.body['unlockStatus'];
    return false;
  }

  @override
  Future<StepBase?> calculateResult(data) async {
    return ResultActivityModel(
      receivedPoints: 1100,
      burnoutIndex: 30,
      burnoutValue: 'Unknown status',
    );
  }
}
