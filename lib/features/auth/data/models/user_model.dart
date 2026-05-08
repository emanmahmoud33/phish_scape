class UserModel {

  final String email;

  final String level;

  final String firstName;

  final String lastName;

  UserModel({
    required this.email,
    required this.level,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(
      Map<String, dynamic> json,
      ) {

    return UserModel(

      email: json['email'] ?? '',

      level: json['level'] ?? '',

      firstName: json['firstName'] ?? '',

      lastName: json['lastName'] ?? '',
    );
  }
}