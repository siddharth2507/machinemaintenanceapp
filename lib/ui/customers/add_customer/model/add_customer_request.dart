class AddCustomerRequest {
  String? name;
  String? email;
  String? company_name;
  String? number;
  String? token;
  int? id;


  AddCustomerRequest({
    this.name,
    this.email,
    this.company_name,
    this.number,
    this.token,
    this.id
  });


  static AddCustomerRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    AddCustomerRequest AddCustomerRequestBean = AddCustomerRequest();
    AddCustomerRequestBean.name = map['name'];
    AddCustomerRequestBean.email = map['email'];
    AddCustomerRequestBean.company_name = map['company_name'];
    AddCustomerRequestBean.number = map['number'];
    AddCustomerRequestBean.token = map['token'];
    AddCustomerRequestBean.id = map['id'];
    return AddCustomerRequestBean;
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "company_name": company_name,
    "number": number,
    "token": token,
    "id":id
  };

}