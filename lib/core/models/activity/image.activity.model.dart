import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class ImageActivityModel with BaseModel, StepBase {
  String? title;
  String? description;

  ImageActivityModel({
    this.title,
    this.description,
  });

  @override
  String startPage = 'activity/image';
}
