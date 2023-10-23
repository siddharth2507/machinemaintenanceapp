class DeleteCustomerRequest {
  String? token;
  int? id;

  DeleteCustomerRequest({
    this.token,
    this.id
  });


  static DeleteCustomerRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    DeleteCustomerRequest DeleteCustomerRequestBean = DeleteCustomerRequest();
    DeleteCustomerRequestBean.token = map['token'];
    DeleteCustomerRequestBean.id = map['id'];
    return DeleteCustomerRequestBean;
  }

  Map<String, dynamic> toJson() => {
    "token": token,
    "id":id
  };

}