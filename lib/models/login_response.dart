class LoginResponse {
  String token;
  String email;

  LoginResponse({this.token, this.email});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['email'] = this.email;
    return data;
  }
}
