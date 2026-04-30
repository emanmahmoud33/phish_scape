class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String level;
  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.level,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      level: json['level'] ?? '',
    );
  }
}