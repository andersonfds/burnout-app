import 'package:app/core/models/activity/activity.model.dart';
import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/models.dart';

abstract class IActivityRepository {
  /// Gets a full list of activities
  Future<List<ActivityModel>?> getAll();

  /// downloads the activity
  Future<StepList?> downloadActivity(String? activityId);

  /// unlocks the activity
  Future<bool> unlock(String? id);

  Future<StepBase?> calculateResult(dynamic data);
}
