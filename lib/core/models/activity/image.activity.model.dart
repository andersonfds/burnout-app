import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class ImageActivityModel with BaseModel, ActivityBase {
  String? title;
  String? description;

  ImageActivityModel({
    int? id,
    this.title,
    this.description,
    int? goNext,
  }) {
    this.goNext = goNext;
    this.id = id;
  }

  @override
  String startPage = 'activity/image';
}
