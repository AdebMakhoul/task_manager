class LoginModel {
  String? token;
  String? username;
  String? image;
  int? id;

  LoginModel(
      {this.token,
        this.username,
        this.image,
        this.id});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['username'] = username;
    data['image'] = image;
    data['id'] = id;
    return data;
  }
}