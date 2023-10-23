/// status : true
/// message : "Record added successfully."
/// data : []

class SaveCustomerResponse {
  SaveCustomerResponse({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  SaveCustomerResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _status;
  String? _message;
  Data? _data;

  SaveCustomerResponse copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      SaveCustomerResponse(
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
    String? companyName,
    String? name,
    String? number,
    String? email,
    String? userId,
    String? deletedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _companyName = companyName;
    _name = name;
    _number = number;
    _email = email;
    _userId = userId;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _companyName = json['company_name'];
    _name = json['name'];
    _number = json['number'];
    _email = json['email'];
    _userId = json['user_id'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _companyName;
  String? _name;
  String? _number;
  String? _email;
  String? _userId;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  Data copyWith({
    int? id,
    String? companyName,
    String? name,
    String? number,
    String? email,
    String? userId,
    String? deletedAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
          id: id ?? _id,
          companyName: companyName ?? _companyName,
          name: name ?? _name,
          number: number ?? _number,
          email: email ?? _email,
          userId: userId ?? _userId,
          deletedAt: deletedAt ?? _deletedAt,
          createdAt: createdAt ?? _createdAt,
          updatedAt: updatedAt ?? _updatedAt);

  int? get id => _id;

  String? get companyName => _companyName;

  String? get name => _name;

  String? get number => _number;

  String? get email => _email;

  String? get userId => _userId;

  String? get deletedAt => _deletedAt;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_name'] = _companyName;
    map['name'] = _name;
    map['number'] = _number;
    map['email'] = _email;
    map['user_id'] = _userId;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
