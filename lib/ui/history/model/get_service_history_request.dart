class GetServiceHistoryRequest {
  String? token;
  int? customer_id;
  int? equipment_id;
  int? status;
  String? start_date;
  String? end_date;
  String? unit_number;

  GetServiceHistoryRequest(
      {this.token,
      this.customer_id,
      this.equipment_id,
      this.status,
      this.start_date,
      this.end_date,
      this.unit_number});

  static GetServiceHistoryRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    GetServiceHistoryRequest GetServiceHistoryRequestBean =
        GetServiceHistoryRequest();
    GetServiceHistoryRequestBean.token = map['token'];
    GetServiceHistoryRequestBean.customer_id = map['customer_id'];
    GetServiceHistoryRequestBean.equipment_id = map['equipment_id'];
    GetServiceHistoryRequestBean.status = map['status'];
    GetServiceHistoryRequestBean.start_date = map['start_date'];
    GetServiceHistoryRequestBean.end_date = map['end_date'];
    GetServiceHistoryRequestBean.unit_number = map['unit_number'];
    return GetServiceHistoryRequestBean;
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "customer_id": customer_id,
        "equipment_id": equipment_id,
        "status": status,
        "start_date": start_date,
        "unit_number": unit_number,
      };
}
