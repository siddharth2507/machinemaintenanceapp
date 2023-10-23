class AddEquipmentRequest {
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
  String? last_service_reading;
  String? type;
  String? last_engine_service_date_and_hours;
  String? next_service_dates;


  AddEquipmentRequest({
    this.machine_name,
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
    this.last_service_reading,
    this.type,
    this.last_engine_service_date_and_hours,
    this.next_service_dates,
  });


  static AddEquipmentRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    AddEquipmentRequest AddEquipmentRequestBean = AddEquipmentRequest();
    AddEquipmentRequestBean.machine_name = map['machine_name'];
    AddEquipmentRequestBean.unit_number = map['unit_number'];
    AddEquipmentRequestBean.make = map['make'];
    AddEquipmentRequestBean.model = map['model'];
    AddEquipmentRequestBean.date_of_manufactur = map['date_of_manufactur'];
    AddEquipmentRequestBean.date_of_commission = map['date_of_commission'];
    AddEquipmentRequestBean.date_of_10_year_major = map['date_of_10_year_major'];
    AddEquipmentRequestBean.date_of_15_year_major = map['date_of_15_year_major'];
    AddEquipmentRequestBean.token = map['token'];
    AddEquipmentRequestBean.customer_id = map['customer_id'];
    AddEquipmentRequestBean.serial_number = map['serial_number'];
    AddEquipmentRequestBean.service_date = map['service_date'];
    AddEquipmentRequestBean.last_service_reading = map['last_service_reading'];
    AddEquipmentRequestBean.type = map['type'];
    AddEquipmentRequestBean.last_engine_service_date_and_hours = map['last_engine_service_date_and_hours'];
    AddEquipmentRequestBean.next_service_dates = map['next_service_dates'];
    return AddEquipmentRequestBean;
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
    "customer_id":customer_id,
    "serial_number":serial_number,
    "service_date":service_date,
    "last_service_reading":last_service_reading,
    "type":type,
    "last_engine_service_date_and_hours":last_engine_service_date_and_hours,
    "next_service_dates":next_service_dates,
  };

}