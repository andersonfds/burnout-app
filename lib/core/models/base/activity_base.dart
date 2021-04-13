import 'package:app/core/models/activity_enum.dart';

mixin ActivityBase {
  late int? id;
  late int? goNext;
  late ActivityEnum activityType;
  late String startPage;
}
