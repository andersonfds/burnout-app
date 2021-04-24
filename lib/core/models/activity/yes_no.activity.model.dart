import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class YesNoActivityModel with BaseModel, StepBase {
  String? title;
  String? description;

  YesNoActivityModel({
    this.title,
    this.description,
  });

  @override
  String startPage = 'activity/yesNo';
}
