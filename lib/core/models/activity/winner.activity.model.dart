import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class WinnerActivityModel with BaseModel, ActivityBase {
  WinnerActivityModel({
    int? id,
    int? goNext,
  }) {
    this.goNext = goNext;
    this.id = id;
  }

  @override
  String startPage = 'activity/winner';
}
