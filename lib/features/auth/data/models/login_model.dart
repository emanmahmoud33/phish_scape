class LoginModel {
  final String token;
  final String refreshToken;

  LoginModel({
    required this.token,
    required this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }
}