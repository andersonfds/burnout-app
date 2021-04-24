import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class SelectionActivityModel with BaseModel, StepBase {
  SelectionActivityModel();

  @override
  String startPage = 'activity/selection';
}
