import 'package:app/core/config/environment.dart';
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
}
