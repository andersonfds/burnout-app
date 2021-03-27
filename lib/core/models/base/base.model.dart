import 'dart:convert';

mixin BaseModel<TModel> {
  /// The raw json, only set when called
  /// to `this.fill` method
  dynamic rawJson;

  /// Creates a new instance of the class filled
  /// with the properties of the [json] values provided
  /// in most cases [json] will be a `Map<String, dynamic`
  TModel fill(dynamic json) => rawJson = json;

  /// Force a cast from [rawJson] into a `Map<String, dynamic>`
  /// it will throw an error if [rawJson] is not a subtype
  /// of `Map<String, dynamic>`
  Map<String, dynamic> asMap() => rawJson as Map<String, dynamic>;

  /// Gets the [rawJson] and encodes it into a string
  @override
  String toString() => json.encode(rawJson);
}
