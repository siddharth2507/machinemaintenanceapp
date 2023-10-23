class EditCustomerRequest {
  String? name;
  String? email;
  String? company_name;
  String? number;
  String? token;
  int? id;

  EditCustomerRequest(
      {this.name,
      this.email,
      this.company_name,
      this.number,
      this.token,
      this.id});

  static EditCustomerRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    EditCustomerRequest EditCustomerRequestBean = EditCustomerRequest();
    EditCustomerRequestBean.name = map['name'];
    EditCustomerRequestBean.email = map['email'];
    EditCustomerRequestBean.company_name = map['company_name'];
    EditCustomerRequestBean.number = map['number'];
    EditCustomerRequestBean.token = map['token'];
    EditCustomerRequestBean.id = map['id'];
    return EditCustomerRequestBean;
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "company_name": company_name,
        "number": number,
        "token": token,
        "id": id
      };
}
