import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class ResultActivityModel with BaseModel, StepBase {
  final int receivedPoints;
  final int burnoutIndex;
  final int nextLevel;
  final bool completedLevel;
  final String burnoutValue;

  ResultActivityModel({
    required this.burnoutValue,
    this.burnoutIndex = 0,
    this.receivedPoints = 0,
    this.completedLevel = false,
    this.nextLevel = 1,
  });

  @override
  ResultActivityModel fill(dynamic json) =>
      ResultActivityModel(burnoutValue: 'Estressado p krl');

  @override
  String startPage = 'activity/results';
}
