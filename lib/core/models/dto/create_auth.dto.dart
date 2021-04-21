import 'package:get/get.dart';

class CreateAuthDto {
  String? identifier;
  String? password;

  CreateAuthDto({
    this.identifier,
    this.password,
  });

  bool get isValid =>
      identifier?.isEmail == true && password?.isNotEmpty == true;

  Map<String, dynamic> asMap() => {
        'identifier': identifier,
        'password': password,
      };
}
