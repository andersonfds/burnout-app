import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class YesNoActivityModel with BaseModel, ActivityBase {
  String? title;
  String? description;

  YesNoActivityModel({
    int? id,
    this.title,
    this.description,
    int? goNext,
  }) {
    this.goNext = goNext;
    this.id = id;
  }

  @override
  String startPage = 'activity/yesNo';
}
