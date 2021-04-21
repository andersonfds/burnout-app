import 'base/base.model.dart';

class AuthModel with BaseModel<AuthModel> {
  String? token;

  AuthModel({
    this.token,
  });

  @override
  AuthModel fill(dynamic json) => AuthModel(
        token: json['accessToken'],
      );

  @override
  Map<String, dynamic> asMap() => {};
}
