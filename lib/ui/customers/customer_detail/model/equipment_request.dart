class EquipmentRequest {
  String? token;
  int? customer_id;

  EquipmentRequest({
    this.token,
    this.customer_id
  });


  static EquipmentRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    EquipmentRequest EquipmentRequestBean = EquipmentRequest();
    EquipmentRequestBean.token = map['token'];
    EquipmentRequestBean.customer_id = map['customer_id'];
    return EquipmentRequestBean;
  }

  Map<String, dynamic> toJson() => {
    "token": token,
    "customer_id":customer_id
  };

}