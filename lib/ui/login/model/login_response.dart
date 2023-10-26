/// status : true
/// message : "Login successfully."
/// data : {"user":{"id":3,"name":"Ramesh Jadav","email":"rameshjadav133@gmail.com"},"token":"6|2pFx3R5P0CksR2J4YLdR3yYdM0Tq54NndJTyNi4H"}

class LoginResponse {
  LoginResponse({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  LoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _status;
  String? _message;
  Data? _data;

  LoginResponse copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      LoginResponse(
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

/// user : {"id":3,"name":"Ramesh Jadav","email":"rameshjadav133@gmail.com"}
/// token : "6|2pFx3R5P0CksR2J4YLdR3yYdM0Tq54NndJTyNi4H"

class Data {
  Data({
    User? user,
    String? token,
  }) {
    _user = user;
    _token = token;
  }

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }

  User? _user;
  String? _token;

  Data copyWith({
    User? user,
    String? token,
  }) =>
      Data(
        user: user ?? _user,
        token: token ?? _token,
      );

  User? get user => _user;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }
}

/// id : 3
/// name : "Ramesh Jadav"
/// email : "rameshjadav133@gmail.com"

class User {
  User({
    num? id,
    String? name,
    String? email,
  }) {
    _id = id;
    _name = name;
    _email = email;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
  }

  num? _id;
  String? _name;
  String? _email;

  User copyWith({
    num? id,
    String? name,
    String? email,
  }) =>
      User(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
      );

  num? get id => _id;

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
