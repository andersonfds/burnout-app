import 'package:app/core/models/activity_enum.dart';
import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class ImageQuestionModel with BaseModel, ActivityBase {
  String? title;
  String? description;

  ImageQuestionModel({
    int? id,
    this.title,
    this.description,
    int? goNext,
  }) {
    this.goNext = goNext;
    this.id = id;
  }

  @override
  ActivityEnum activityType = ActivityEnum.yesNoQuestion;

  @override
  String startPage = 'activity/image';
}
