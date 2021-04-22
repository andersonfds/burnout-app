import 'package:app/core/models/base/base.model.dart';
import 'package:app/shared/utils/utils.dart';
import 'package:collection/collection.dart';

class ValidationItem with BaseModel {
  String? property;
  List<String>? value;

  ValidationItem({
    this.property,
    this.value,
  });

  @override
  ValidationItem fill(dynamic json) {
    super.fill(json);
    return ValidationItem(
      property: json['property'],
      value: (json['value'] as List).map((e) => e.toString()).toList(),
    );
  }
}

class ValidationModel with BaseModel {
  int? statusCode;
  List<ValidationItem>? errors;

  ValidationModel({
    this.statusCode,
    this.errors,
  });

  String? getFirstError(String key) {
    final output = errors?.firstWhereOrNull((e) => e.property == key);
    return output?.value?.first;
  }

  @override
  ValidationModel fill(dynamic json) {
    super.fill(json);
    return ValidationModel(
      statusCode: json['statusCode'],
      errors: ValidationItem().listOf<ValidationItem>(json['errors']),
    );
  }
}
