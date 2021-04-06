import 'package:app/core/models/activity.model.dart';
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

  @override
  ActivityModel get model => ActivityModel();
}
