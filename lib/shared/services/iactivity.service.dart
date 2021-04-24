import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/models.dart';

abstract class IActivityService {
  /// Gets a full list of activities
  Future<List<ActivityModel>?> getAll();

  /// downloads the activity
  Future<StepList?> downloadActivity(String? id);

  Future<void> next(StepBase? current);

  Future<void> handleAction(String action, StepBase step);

  Future<void> startActivity(String? id);
}
