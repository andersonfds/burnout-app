import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class BurnoutActivityModel with BaseModel, StepBase {
  String? question;
  String? onAccept;

  BurnoutActivityModel({
    String? id,
    this.question,
    this.onAccept,
  }) {
    super.id = id;
  }

  @override
  BurnoutActivityModel fill(dynamic json) => BurnoutActivityModel(
        id: this.id,
        question: json['question'],
        onAccept: json['onAccept'],
      );

  @override
  String startPage = 'activity/burnout';
}
