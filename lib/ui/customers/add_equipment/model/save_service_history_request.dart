class SaveServiceHistoryRequest {
  int? customer_id;
  int? equipment_id;
  String? last_service_date;
  String? next_service_dates;
  String? service_type;
  String? last_engine_service_date_and_hours;
  String? notes;
  String? token;
  String? last_service_reading;
  dynamic attchement;
  int? id;

  


  SaveServiceHistoryRequest({
    this.customer_id,
    this.equipment_id,
    this.last_service_date,
    this.next_service_dates,
    this.service_type,
    this.last_engine_service_date_and_hours,
    this.notes,
    this.token,
    this.last_service_reading,
    this.attchement,
    this.id,

  });


  static SaveServiceHistoryRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    SaveServiceHistoryRequest SaveServiceHistoryRequestBean = SaveServiceHistoryRequest();
    SaveServiceHistoryRequestBean.customer_id = map['customer_id'];
    SaveServiceHistoryRequestBean.equipment_id = map['equipment_id'];
    SaveServiceHistoryRequestBean.last_service_date = map['last_service_date'];
    SaveServiceHistoryRequestBean.next_service_dates = map['next_service_dates'];
    SaveServiceHistoryRequestBean.service_type = map['service_type'];
    SaveServiceHistoryRequestBean.last_engine_service_date_and_hours = map['last_engine_service_date_and_hours'];
    SaveServiceHistoryRequestBean.notes = map['notes'];
    SaveServiceHistoryRequestBean.token = map['token'];
    SaveServiceHistoryRequestBean.last_service_reading = map['last_service_reading'];
    SaveServiceHistoryRequestBean.attchement = map['attchement'];
    SaveServiceHistoryRequestBean.id = map['id'];
    return SaveServiceHistoryRequestBean;
  }

  Map<String, dynamic> toJson() => {
    "customer_id": customer_id,
    "equipment_id": equipment_id,
    "last_service_date": last_service_date,
    "next_service_dates": next_service_dates,
    "service_type": service_type,
    "last_engine_service_date_and_hours": last_engine_service_date_and_hours,
    "notes": notes,
    "token": token,
    "last_service_reading": last_service_reading,
    "attchement": attchement,
    "id": id,

  };

}