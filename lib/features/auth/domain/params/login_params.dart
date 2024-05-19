class LoginParams {
  String? username;
  String? password;

  LoginParams(
      {this.username,
      this.password});

  factory LoginParams.empty() {
    return LoginParams(
        username: '',
        password: '');
  }

  LoginParams.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = username;
    data['password'] = password;
    data['expiresInMins'] = 30;
    return data;
  }

  LoginParams copyWith({
    String? username,
    String? password,
  }) {
    return LoginParams(
        username:
            username ?? this.username,
        password: password ?? this.password);
  }
}
