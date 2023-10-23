class DeleteEquipmentRequest {
  String? token;
  int? id;

  DeleteEquipmentRequest({this.token, this.id});

  static DeleteEquipmentRequest? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    DeleteEquipmentRequest DeleteEquipmentRequestBean =
        DeleteEquipmentRequest();
    DeleteEquipmentRequestBean.token = map['token'];
    DeleteEquipmentRequestBean.id = map['id'];
    return DeleteEquipmentRequestBean;
  }

  Map<String, dynamic> toJson() => {"token": token, "id": id};
}
