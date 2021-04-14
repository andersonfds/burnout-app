import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class TextActivityModel with BaseModel, ActivityBase {
  String? title;
  String? description;

  TextActivityModel({
    int? id,
    this.title,
    this.description,
    int? goNext,
  }) {
    this.goNext = goNext;
    this.id = id;
  }

  @override
  String startPage = 'activity/text';
}
