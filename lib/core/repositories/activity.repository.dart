import 'package:app/core/models/models.dart';
import 'package:app/core/models/activity/selection.activity.model.dart';
import 'package:app/core/models/activity/yes_no.activity.model.dart';
import 'package:app/shared/repositories/repositories.dart';

import 'base/network.repository.dart';

class ActivityRepository extends NetworkRepository<ActivityModel>
    implements IActivityRepository {
  @override
  Future<List<ActivityModel>?> getAll() async {
    await Future.delayed(Duration(seconds: 1), () {});
    return List.generate(
      10,
      (index) => ActivityModel(
        id: index + 1,
        flag: 'Conhecimento',
        price: (index + 1) * 20,
        unlockPrice: index % 2 == 0 ? null : 300,
        levelName: 'Nível ${index + 1}',
        name: 'Lorem ipsum dolor sit amet',
        description: 'lorem ipsum dolor sit amet foo bar cox',
        locked: index % 2 != 0,
      ),
    );
  }

  Future<ActivityList?> downloadActivity() async {
    await Future.delayed(Duration(seconds: 1), () {});

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
