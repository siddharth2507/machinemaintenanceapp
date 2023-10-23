class LoginRequest {
  String? email;
  String? password;

  LoginRequest({
    this.email,
    this.password,
  });


  static LoginRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    LoginRequest LoginRequestBean = LoginRequest();
    LoginRequestBean.email = map['email'];
    LoginRequestBean.password = map['password'];
    return LoginRequestBean;
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };

}