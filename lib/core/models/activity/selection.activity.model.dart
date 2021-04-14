import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class SelectionActivityModel with BaseModel, ActivityBase {
  SelectionActivityModel({
    int? id,
    int? goNext,
  }) {
    this.goNext = goNext;
    this.id = id;
  }

  @override
  String startPage = 'activity/selection';
}
