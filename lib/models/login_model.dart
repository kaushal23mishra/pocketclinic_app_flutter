class LoginModel {
  String? accessToken;
  String? email;

  LoginModel({this.accessToken, this.email});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['email'] = email;
    return data;
  }
}
