class EditEquipmentRequest {
  String? machine_name;
  String? unit_number;
  String? make;
  String? model;
  String? token;
  String? date_of_manufactur;
  String? date_of_commission;
  String? date_of_10_year_major;
  String? date_of_15_year_major;
  int? customer_id;
  String? serial_number;
  String? service_date;
  String? last_service_hours;
  String? type;
  String? last_engine_service_date_and_hours;
  String? next_service_dates;
  int? id;

  EditEquipmentRequest(
      {this.machine_name,
      this.unit_number,
      this.make,
      this.model,
      this.token,
      this.date_of_manufactur,
      this.date_of_commission,
      this.date_of_10_year_major,
      this.date_of_15_year_major,
      this.customer_id,
      this.serial_number,
      this.service_date,
      this.last_service_hours,
      this.type,
      this.last_engine_service_date_and_hours,
      this.next_service_dates,
      this.id});

  static EditEquipmentRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    EditEquipmentRequest EditEquipmentRequestBean = EditEquipmentRequest();
    EditEquipmentRequestBean.machine_name = map['machine_name'];
    EditEquipmentRequestBean.unit_number = map['unit_number'];
    EditEquipmentRequestBean.make = map['make'];
    EditEquipmentRequestBean.model = map['model'];
    EditEquipmentRequestBean.date_of_manufactur = map['date_of_manufactur'];
    EditEquipmentRequestBean.date_of_commission = map['date_of_commission'];
    EditEquipmentRequestBean.date_of_10_year_major =
        map['date_of_10_year_major'];
    EditEquipmentRequestBean.date_of_15_year_major =
        map['date_of_15_year_major'];
    EditEquipmentRequestBean.token = map['token'];
    EditEquipmentRequestBean.customer_id = map['customer_id'];
    EditEquipmentRequestBean.serial_number = map['serial_number'];
    EditEquipmentRequestBean.service_date = map['service_date'];
    EditEquipmentRequestBean.last_service_hours = map['last_service_hours'];
    EditEquipmentRequestBean.type = map['type'];
    EditEquipmentRequestBean.last_engine_service_date_and_hours =
        map['last_engine_service_date_and_hours'];
    EditEquipmentRequestBean.next_service_dates = map['next_service_dates'];
    EditEquipmentRequestBean.id = map['id'];
    return EditEquipmentRequestBean;
  }

  Map<String, dynamic> toJson() => {
        "machine_name": machine_name,
        "unit_number": unit_number,
        "make": make,
        "model": model,
        "date_of_manufactur": date_of_manufactur,
        "date_of_commission": date_of_commission,
        "date_of_10_year_major": date_of_10_year_major,
        "date_of_15_year_major": date_of_15_year_major,
        "token": token,
        "customer_id": customer_id,
        "serial_number": serial_number,
        "service_date": service_date,
        "last_service_hours": last_service_hours,
        "type": type,
        "last_engine_service_date_and_hours":
            last_engine_service_date_and_hours,
        "next_service_dates": next_service_dates,
        "id": id,
      };
}
