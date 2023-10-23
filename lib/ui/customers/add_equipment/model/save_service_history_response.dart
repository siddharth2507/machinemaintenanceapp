/// status : true
/// message : "Record added successfully."
/// data : []

class SaveServiceHistoryResponse {
  SaveServiceHistoryResponse({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  SaveServiceHistoryResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _status;
  String? _message;
  Data? _data;

  SaveServiceHistoryResponse copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      SaveServiceHistoryResponse(
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
    String? nextServiceDates,
  }) {
    _id = id;
    _nextServiceDates = nextServiceDates;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _nextServiceDates = json['next_service_dates'];
  }

  int? _id;
  String? _nextServiceDates;


  Data copyWith({
    int? id,
    String? nextServiceDates,

  }) =>
      Data(
          id: id ?? _id,
        nextServiceDates: nextServiceDates ?? _nextServiceDates,
          );

  int? get id => _id;
  String? get nextServiceDates => _nextServiceDates;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['next_service_dates'] = _nextServiceDates;

    return map;
  }
}