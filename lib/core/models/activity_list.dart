import 'package:app/core/models/base/activity_base.dart';

class ActivityList {
  final List<ActivityBase>? values;

  ActivityList({this.values});

  ActivityBase? get first => values?.first;
}
