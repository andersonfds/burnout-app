import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class BurnoutActivityModel with BaseModel, StepBase {
  String? question;
  String? onAccept;

  BurnoutActivityModel({
    this.question,
    this.onAccept,
  });

  @override
  BurnoutActivityModel fill(dynamic json) => BurnoutActivityModel(
        question: json['question'],
        onAccept: json['onAccept'],
      );

  @override
  String startPage = 'activity/burnout';
}
