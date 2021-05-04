import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class ResultActivityModel with BaseModel, StepBase {
  @override
  ResultActivityModel fill(dynamic json) => ResultActivityModel();

  @override
  String startPage = 'activity/results';
}
