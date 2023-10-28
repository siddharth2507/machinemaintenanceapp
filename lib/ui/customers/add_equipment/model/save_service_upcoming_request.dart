class SaveServiceUpcomingRequest {
  int? customer_id;
  int? equipment_id;
  String? next_service_dates;
  String? token;

  SaveServiceUpcomingRequest({
    this.customer_id,
    this.equipment_id,
    this.next_service_dates,
    this.token,
  });

  static SaveServiceUpcomingRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    SaveServiceUpcomingRequest SaveServiceHistoryRequestBean = SaveServiceUpcomingRequest();
    SaveServiceHistoryRequestBean.customer_id = map['customer_id'];
    SaveServiceHistoryRequestBean.equipment_id = map['equipment_id'];
    SaveServiceHistoryRequestBean.next_service_dates = map['next_service_dates'];
    SaveServiceHistoryRequestBean.token = map['token'];
    return SaveServiceHistoryRequestBean;
  }

  Map<String, dynamic> toJson() => {
    "customer_id": customer_id,
    "equipment_id": equipment_id,
    "next_service_dates": next_service_dates,
    "token": token,
  };

}