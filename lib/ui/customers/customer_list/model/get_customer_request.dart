class GetCustomerRequest {
  String? token;


  GetCustomerRequest({
    this.token
  });


  static GetCustomerRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    GetCustomerRequest GetCustomerRequestBean = GetCustomerRequest();
    GetCustomerRequestBean.token = map['token'];
    return GetCustomerRequestBean;
  }

  Map<String, dynamic> toJson() => {
    "token": token,
  };

}