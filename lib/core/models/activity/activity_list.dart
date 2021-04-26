import 'package:app/core/models/activity/burnout.activity.dart';
import 'package:app/core/models/activity/options.activity.model.dart';
import 'package:app/core/models/activity/text.activity.model.dart';
import 'package:app/core/models/base/activity_base.dart';

class StepList {
  final String? id;
  final List<StepBase?>? values;

  StepList({this.values, this.id});

  factory StepList.fromJson(String? id, dynamic json) {
    List<StepBase?> values =
        (json as List).map<StepBase?>((e) => getForType(e)).toList();
    return StepList(id: id, values: values);
  }

  static StepBase? getForType(dynamic json) {
    final content = json['content'];
    switch (json['type']) {
      case 'text':
        return TextActivityModel().fill(content);
      case 'options':
        return OptionsActivityModel().fill(content);
      case 'burnout':
        return BurnoutActivityModel().fill(content);
      default:
        return null;
    }
  }

  StepBase? get first => values?.first;
}
