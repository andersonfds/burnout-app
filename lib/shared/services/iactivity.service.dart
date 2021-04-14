import 'package:app/core/models/models.dart';

abstract class IActivityService {
  /// Gets a full list of activities
  Future<List<ActivityModel>?> getAll();

  /// downloads the activity
  Future<ActivityList?> downloadActivity();

  Future<void> triggerActivity(int? id);
}
