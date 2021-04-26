import 'package:app/core/models/base/activity_base.dart';
import 'package:app/core/models/base/base.model.dart';
import 'package:app/shared/utils/utils.dart';

class OptionItem with BaseModel {
  final String? value;
  final String? content;

  OptionItem({
    this.value,
    this.content,
  });

  @override
  OptionItem fill(dynamic json) => OptionItem(
        content: json['content'],
        value: json['value'],
      );
}

class OptionsActivityModel with BaseModel, StepBase {
  final String? mode;
  List<OptionItem>? options;

  OptionsActivityModel({
    this.mode,
    this.options,
  });

  @override
  OptionsActivityModel fill(dynamic json) => OptionsActivityModel(
        options: OptionItem().listOf(json['options']),
        mode: json['mode'],
      );

  @override
  String startPage = 'activity/selection';
}
