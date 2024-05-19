class ErrorModel {
  int? code;
  String? message;
  dynamic details;

  ErrorModel({this.code, this.message, this.details});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['details'] = details;
    return data;
  }
}