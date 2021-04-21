class CreateUserDto {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  CreateUserDto({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  Map<String, dynamic> asMap() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };
}
