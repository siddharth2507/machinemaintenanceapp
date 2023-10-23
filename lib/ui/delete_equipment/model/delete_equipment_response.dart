/// status : true
/// message : "Record deleted successfully."
/// data : []

class DeleteEquipmentResponse {
  DeleteEquipmentResponse({
    bool? status,
    String? message,
    List<dynamic>? data,
  }) {
    _status = status;
    _message = message;
  }

  DeleteEquipmentResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }

  bool? _status;
  String? _message;
  List<dynamic>? _data;

  DeleteEquipmentResponse copyWith({
    bool? status,
    String? message,
    List<dynamic>? data,
  }) =>
      DeleteEquipmentResponse(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  List<dynamic>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
