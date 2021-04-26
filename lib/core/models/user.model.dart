import 'package:app/core/models/base/base.model.dart';

class UserModel with BaseModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? initials;
  final String? email;
  final bool? verified;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.initials,
    this.email,
    this.verified,
  });

  @override
  UserModel fill(dynamic json) {
    super.fill(json);
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      initials: json['initials'],
      verified: json['verified'],
    );
  }

  @override
  Map<String, dynamic> asMap() => {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'fullName': fullName,
        'initials': initials,
        'verified': verified,
      };
}
