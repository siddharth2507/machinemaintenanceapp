/// status : true
/// message : "Record fetch successfully."
/// data : {"total":2,"perPage":50,"currentPage":1,"lastPage":1,"customers":[{"id":3,"company_name":"Test123","name":"Nemi Patel","email":"nemi@yopmail.com","number":"9685965868","create_by":{"id":3,"name":"Ramesh Jadav","email":"rameshjadav133@gmail.com"}},{"id":2,"company_name":"Test123","name":"Sumeet Patel","email":"sumeet@yopmail.com","number":"9685965868","create_by":{"id":3,"name":"Ramesh Jadav","email":"rameshjadav133@gmail.com"}}]}

class CustomerResponse {
  CustomerResponse({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  CustomerResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _status;
  String? _message;
  Data? _data;

  CustomerResponse copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      CustomerResponse(
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

/// total : 2
/// perPage : 50
/// currentPage : 1
/// lastPage : 1
/// customers : [{"id":3,"company_name":"Test123","name":"Nemi Patel","email":"nemi@yopmail.com","number":"9685965868","create_by":{"id":3,"name":"Ramesh Jadav","email":"rameshjadav133@gmail.com"}},{"id":2,"company_name":"Test123","name":"Sumeet Patel","email":"sumeet@yopmail.com","number":"9685965868","create_by":{"id":3,"name":"Ramesh Jadav","email":"rameshjadav133@gmail.com"}}]

class Data {
  Data({
    num? total,
    num? perPage,
    num? currentPage,
    num? lastPage,
    List<Customers>? customers,
  }) {
    _total = total;
    _perPage = perPage;
    _currentPage = currentPage;
    _lastPage = lastPage;
    _customers = customers;
  }

  Data.fromJson(dynamic json) {
    _total = json['total'];
    _perPage = json['perPage'];
    _currentPage = json['currentPage'];
    _lastPage = json['lastPage'];
    if (json['customers'] != null) {
      _customers = [];
      json['customers'].forEach((v) {
        _customers?.add(Customers.fromJson(v));
      });
    }
  }

  num? _total;
  num? _perPage;
  num? _currentPage;
  num? _lastPage;
  List<Customers>? _customers;

  Data copyWith({
    num? total,
    num? perPage,
    num? currentPage,
    num? lastPage,
    List<Customers>? customers,
  }) =>
      Data(
        total: total ?? _total,
        perPage: perPage ?? _perPage,
        currentPage: currentPage ?? _currentPage,
        lastPage: lastPage ?? _lastPage,
        customers: customers ?? _customers,
      );

  num? get total => _total;

  num? get perPage => _perPage;

  num? get currentPage => _currentPage;

  num? get lastPage => _lastPage;

  List<Customers>? get customers => _customers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['perPage'] = _perPage;
    map['currentPage'] = _currentPage;
    map['lastPage'] = _lastPage;
    if (_customers != null) {
      map['customers'] = _customers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 3
/// company_name : "Test123"
/// name : "Nemi Patel"
/// email : "nemi@yopmail.com"
/// number : "9685965868"
/// create_by : {"id":3,"name":"Ramesh Jadav","email":"rameshjadav133@gmail.com"}

class Customers {
  Customers({
    int? id,
    String? companyName,
    String? name,
    String? email,
    String? number,
    CreateBy? createBy,
  }) {
    _id = id;
    _companyName = companyName;
    _name = name;
    _email = email;
    _number = number;
    _createBy = createBy;
  }

  Customers.fromJson(dynamic json) {
    _id = json['id'];
    _companyName = json['company_name'];
    _name = json['name'];
    _email = json['email'];
    _number = json['number'];
    _createBy =
        json['create_by'] != null ? CreateBy.fromJson(json['create_by']) : null;
  }

  int? _id;
  String? _companyName;
  String? _name;
  String? _email;
  String? _number;
  CreateBy? _createBy;

  Customers copyWith({
    int? id,
    String? companyName,
    String? name,
    String? email,
    String? number,
    CreateBy? createBy,
  }) =>
      Customers(
        id: id ?? _id,
        companyName: companyName ?? _companyName,
        name: name ?? _name,
        email: email ?? _email,
        number: number ?? _number,
        createBy: createBy ?? _createBy,
      );

  int? get id => _id;

  String? get companyName => _companyName;

  String? get name => _name;

  String? get email => _email;

  String? get number => _number;

  CreateBy? get createBy => _createBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_name'] = _companyName;
    map['name'] = _name;
    map['email'] = _email;
    map['number'] = _number;
    if (_createBy != null) {
      map['create_by'] = _createBy?.toJson();
    }
    return map;
  }
}

/// id : 3
/// name : "Ramesh Jadav"
/// email : "rameshjadav133@gmail.com"

class CreateBy {
  CreateBy({
    int? id,
    String? name,
    String? email,
  }) {
    _id = id;
    _name = name;
    _email = email;
  }

  CreateBy.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
  }

  int? _id;
  String? _name;
  String? _email;

  CreateBy copyWith({
    int? id,
    String? name,
    String? email,
  }) =>
      CreateBy(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
      );

  int? get id => _id;

  String? get name => _name;

  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    return map;
  }
}
