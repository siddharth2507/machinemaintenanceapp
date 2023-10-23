/// status : true
/// message : "Record updated successfully."
/// data : []

class AddEquipmentResponse {
  AddEquipmentResponse({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  AddEquipmentResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _status;
  String? _message;
  Data? _data;

  AddEquipmentResponse copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      AddEquipmentResponse(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    int? id,
    String? createdBy,
    String? customerId,
    String? machineName,
    String? unitNumber,
    String? make,
    String? model,
    String? serialNumber,
    String? deletedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _createdBy = createdBy;
    _customerId = customerId;
    _machineName = machineName;
    _unitNumber = unitNumber;
    _make = make;
    _model = model;
    _serialNumber = serialNumber;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _createdBy = json['create_by'];
    _customerId = json['customer_id'];
    _machineName = json['company_name'];
    _unitNumber = json['unit_number'];
    _make = json['make'];
    _model = json['model'];
    _serialNumber = json['serial_number'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _createdBy;
  String? _customerId;
  String? _machineName;
  String? _unitNumber;
  String? _make;
  String? _model;
  String? _serialNumber;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  Data copyWith({
    int? id,
    String? createdBy,
    String? customerId,
    String? machineName,
    String? unitNumber,
    String? make,
    String? model,
    String? serialNumber,
    String? deletedAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
          id: id ?? _id,
          createdBy: createdBy ?? _createdBy,
          customerId: customerId ?? _customerId,
          machineName: machineName ?? _machineName,
          unitNumber: unitNumber ?? _unitNumber,
          make: make ?? _make,
          model: model ?? _model,
          serialNumber: serialNumber ?? _serialNumber,
          deletedAt: deletedAt ?? _deletedAt,
          createdAt: createdAt ?? _createdAt,
          updatedAt: updatedAt ?? _updatedAt);

  int? get id => _id;

  String? get createdBy => _createdBy;

  String? get customerId => _customerId;

  String? get machineName => _machineName;

  String? get unitNumber => _unitNumber;

  String? get make => _make;

  String? get model => _model;

  String? get serialNumber => _serialNumber;

  String? get deletedAt => _deletedAt;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['_created_by'] = _createdBy;
    map['customer_id'] = _createdBy;
    map['company_name'] = _machineName;
    map['unit_number'] = _unitNumber;
    map['make'] = _make;
    map['model'] = _model;
    map['serial_number'] = _serialNumber;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
