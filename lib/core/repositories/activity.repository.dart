import 'package:app/core/config/environment.dart';
import 'package:app/core/models/models.dart';
import 'package:app/core/models/activity/selection.activity.model.dart';
import 'package:app/core/models/activity/yes_no.activity.model.dart';
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

  Future<ActivityList?> downloadActivity() async {
    return ActivityList(
      values: [
        YesNoActivityModel(
          id: 1,
          title: 'Lorem ipsum dolor sit amet yay',
          description: 'This is the first page',
          goNext: 2,
        ),
        ImageActivityModel(
          id: 2,
          title: 'atividade de imaegm',
          description: 'atividade 2 com id 345',
          goNext: 3,
        ),
        SelectionActivityModel(
          id: 3,
          goNext: 4,
        ),
        TextActivityModel(
          id: 4,
          goNext: 5,
        ),
        WinnerActivityModel(
          id: 5,
          goNext: null,
        ),
      ],
    );
  }

  @override
  ActivityModel get model => ActivityModel();
}
