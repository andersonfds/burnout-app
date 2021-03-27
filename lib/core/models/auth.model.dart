import 'base/base.model.dart';

class AuthModel with BaseModel<AuthModel> {
  String? token;

  @override
  AuthModel fill(dynamic json) => AuthModel();

  @override
  Map<String, dynamic> asMap() => {};
}
