import 'package:app/core/models/activity.model.dart';

abstract class IActivityRepository {
  /// Gets a full list of activities
  Future<List<ActivityModel>?> getAll();
}
