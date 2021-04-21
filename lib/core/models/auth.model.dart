import 'package:app/core/models/user.model.dart';

import 'base/base.model.dart';

class AuthModel with BaseModel<AuthModel> {
  String? token;
  UserModel? user;

  AuthModel({
    this.token,
    this.user,
  });

  @override
  AuthModel fill(dynamic json) => AuthModel(
        token: json['accessToken'],
        user: UserModel().fill(json['user']),
      );

  @override
  Map<String, dynamic> asMap() => {
        'accessToken': token,
        'user': user?.asMap(),
      };
}
