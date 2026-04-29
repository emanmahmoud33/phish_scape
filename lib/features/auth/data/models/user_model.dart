class UserModel {
  final String? email;

  UserModel({this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? "",
    );
  }
}