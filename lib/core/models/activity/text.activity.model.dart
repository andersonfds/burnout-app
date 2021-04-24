import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';

class TextActivityModel with BaseModel, StepBase {
  String? id;
  String? title;
  String? description;
  String? onAccept;
  String? onCancel;

  TextActivityModel({
    this.id,
    this.title,
    this.description,
    this.onAccept,
    this.onCancel,
  });

  @override
  TextActivityModel fill(dynamic json) => TextActivityModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        onAccept: json['onAccept'],
        onCancel: json['onDeny'],
      );

  @override
  String startPage = 'activity/text';
}
