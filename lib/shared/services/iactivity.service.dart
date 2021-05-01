import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/models.dart';

abstract class IActivityService {
  /// Gets a full list of activities
  Future<List<ActivityModel>?> getAll();

  /// downloads the activity
  Future<StepList?> downloadActivity(String? id);

  /// calls the next step of the game
  Future<void> next(StepBase? current,
      [String? action = 'continue', dynamic data]);

  /// handles actions for a step
  Future<void> handleAction(String action, StepBase step);

  /// starts an step by id
  Future<void> startActivity(String? id);

  /// unlocks the activity
  Future<bool> unlock(String? id);
}
