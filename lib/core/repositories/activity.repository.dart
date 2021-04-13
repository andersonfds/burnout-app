import 'package:app/core/models/models.dart';
import 'package:app/core/models/simple_question.model.dart';
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
        id: 123,
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
        SimpleQuestionModel(
          id: 123,
          title: 'Lorem ipsum dolor sit amet yay',
          description: 'This is the first page',
          goNext: 12333,
        ),
        ImageQuestionModel(
          id: 12333,
          title: 'atividade de imaegm',
          description: 'atividade 2 com id 345',
          goNext: 345,
        ),
        SimpleQuestionModel(
          id: 345,
          title: 'Second activity is rocking!',
          description: 'atividade 2 com id 345',
          goNext: null,
        ),
      ],
    );
  }

  @override
  ActivityModel get model => ActivityModel();
}
