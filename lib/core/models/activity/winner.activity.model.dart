import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class WinnerActivityModel with BaseModel, StepBase {
  WinnerActivityModel();

  @override
  String startPage = 'activity/winner';
}
