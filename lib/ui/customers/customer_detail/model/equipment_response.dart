/// status : true
/// message : "Record fetch successfully."
/// data : {"total":1,"perPage":50,"currentPage":1,"lastPage":1,"equipment":[{"id":3,"create_by":"6","customer_id":"34","machine_name":"HITACHI MACHINE","unit_number":"UNTNMBR234","make":"Werner","model":"SNERMBR6220MJ","date_of_manufactur":"2022-08-10","date_of_commission":"2022-08-10","date_of_10_year_major":"2022-08-10","date_of_15_year_major":"2022-08-10","service_date":null,"last_service_hours":null,"type":null,"last_engine_service_date_and_hours":null,"next_service_dates":null,"created_at":"2023-10-10T04:08:23.000000Z","updated_at":"2023-10-10T04:08:23.000000Z"}]}

class EquipmentResponse {
  EquipmentResponse({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  EquipmentResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _status;
  String? _message;
  Data? _data;

  EquipmentResponse copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      EquipmentResponse(
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

/// total : 1
/// perPage : 50
/// currentPage : 1
/// lastPage : 1
/// equipment : [{"id":3,"create_by":"6","customer_id":"34","machine_name":"HITACHI MACHINE","unit_number":"UNTNMBR234","make":"Werner","model":"SNERMBR6220MJ","date_of_manufactur":"2022-08-10","date_of_commission":"2022-08-10","date_of_10_year_major":"2022-08-10","date_of_15_year_major":"2022-08-10","service_date":null,"last_service_hours":null,"type":null,"last_engine_service_date_and_hours":null,"next_service_dates":null,"created_at":"2023-10-10T04:08:23.000000Z","updated_at":"2023-10-10T04:08:23.000000Z"}]

class Data {
  Data({
    num? total,
    num? perPage,
    num? currentPage,
    num? lastPage,
    List<Equipment>? equipment,
  }) {
    _total = total;
    _perPage = perPage;
    _currentPage = currentPage;
    _lastPage = lastPage;
    _equipment = equipment;
  }

  Data.fromJson(dynamic json) {
    _total = json['total'];
    _perPage = json['perPage'];
    _currentPage = json['currentPage'];
    _lastPage = json['lastPage'];
    if (json['equipment'] != null) {
      _equipment = [];
      json['equipment'].forEach((v) {
        _equipment?.add(Equipment.fromJson(v));
      });
    }
  }

  num? _total;
  num? _perPage;
  num? _currentPage;
  num? _lastPage;
  List<Equipment>? _equipment;

  Data copyWith({
    num? total,
    num? perPage,
    num? currentPage,
    num? lastPage,
    List<Equipment>? equipment,
  }) =>
      Data(
        total: total ?? _total,
        perPage: perPage ?? _perPage,
        currentPage: currentPage ?? _currentPage,
        lastPage: lastPage ?? _lastPage,
        equipment: equipment ?? _equipment,
      );

  num? get total => _total;

  num? get perPage => _perPage;

  num? get currentPage => _currentPage;

  num? get lastPage => _lastPage;

  List<Equipment>? get equipment => _equipment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['perPage'] = _perPage;
    map['currentPage'] = _currentPage;
    map['lastPage'] = _lastPage;
    if (_equipment != null) {
      map['equipment'] = _equipment?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 3
/// create_by : "6"
/// customer_id : "34"
/// machine_name : "HITACHI MACHINE"
/// unit_number : "UNTNMBR234"
/// make : "Werner"
/// model : "SNERMBR6220MJ"
/// date_of_manufactur : "2022-08-10"
/// date_of_commission : "2022-08-10"
/// date_of_10_year_major : "2022-08-10"
/// date_of_15_year_major : "2022-08-10"
/// service_date : null
/// last_service_hours : null
/// type : null
/// last_engine_service_date_and_hours : null
/// next_service_dates : null
/// created_at : "2023-10-10T04:08:23.000000Z"
/// updated_at : "2023-10-10T04:08:23.000000Z"

class Equipment {
  Equipment(
      {int? id,
      String? createBy,
      String? customerId,
      String? machineName,
      String? unitNumber,
      String? make,
      String? model,
      String? serialNumber,
      String? dateOfManufactur,
      String? dateOfCommission,
      String? dateOf10YearMajor,
      String? dateOf15YearMajor,
      dynamic serviceDate,
      dynamic lastServiceHours,
      dynamic type,
      dynamic lastEngineServiceDateAndHours,
      dynamic nextServiceDates,
      String? createdAt,
      String? updatedAt,
      List<LastServiceDetails>? lastServiceDetails,
      List<LastUpcommingServiceDetails>? lastUpcommingServiceDetails,
      List<LastCompletedServiceDetails>? lastCompletedServiceDetails}) {
    _id = id;
    _createBy = createBy;
    _customerId = customerId;
    _machineName = machineName;
    _unitNumber = unitNumber;
    _make = make;
    _model = model;
    _dateOfManufactur = dateOfManufactur;
    _dateOfCommission = dateOfCommission;
    _dateOf10YearMajor = dateOf10YearMajor;
    _dateOf15YearMajor = dateOf15YearMajor;
    _serviceDate = serviceDate;
    _lastServiceHours = lastServiceHours;
    _type = type;
    _lastEngineServiceDateAndHours = lastEngineServiceDateAndHours;
    _nextServiceDates = nextServiceDates;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _lastServiceDetails = lastServiceDetails;
    _lastUpcommingServiceDetails = lastUpcommingServiceDetails;
    _lastCompletedServiceDetails = lastCompletedServiceDetails;
  }

  Equipment.fromJson(dynamic json) {
    _id = json['id'];
    _createBy = json['create_by'];
    _customerId = json['customer_id'];
    _machineName = json['machine_name'];
    _unitNumber = json['unit_number'];
    _make = json['make'];
    _model = json['model'];
    _serialNumber = json['serial_number'];
    _dateOfManufactur = json['date_of_manufactur'];
    _dateOfCommission = json['date_of_commission'];
    _dateOf10YearMajor = json['date_of_10_year_major'];
    _dateOf15YearMajor = json['date_of_15_year_major'];
    _serviceDate = json['service_date'];
    _lastServiceHours = json['last_service_hours'];
    _type = json['type'];
    _lastEngineServiceDateAndHours = json['last_engine_service_date_and_hours'];
    _nextServiceDates = json['next_service_dates'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['lastServiceDetails'] != null) {
      _lastServiceDetails = [];
      json['lastServiceDetails'].forEach((v) {
        _lastServiceDetails?.add(LastServiceDetails.fromJson(v));
      });
    }
    if (json['lastUpcommingServiceDetails'] != null) {
      _lastUpcommingServiceDetails = [];
      json['lastUpcommingServiceDetails'].forEach((v) {
        _lastUpcommingServiceDetails
            ?.add(LastUpcommingServiceDetails.fromJson(v));
      });
    }
    if (json['lastCompletedServiceDetails'] != null) {
      _lastCompletedServiceDetails = [];
      //print("parsedata ${json['lastCompletedServiceDetails'][0]['id']}");
      json['lastCompletedServiceDetails'].forEach((v) {
        _lastCompletedServiceDetails
            ?.add(LastCompletedServiceDetails.fromJson(v));
       // print("parsedata ${_lastCompletedServiceDetails!.length}");
      });

   //   print("parsedata IDDDDD ${_lastCompletedServiceDetails!.first.id}");
    }
  }

  int? _id;
  String? _createBy;
  String? _customerId;
  String? _machineName;
  String? _unitNumber;
  String? _make;
  String? _model;
  String? _serialNumber;
  String? _dateOfManufactur;
  String? _dateOfCommission;
  String? _dateOf10YearMajor;
  String? _dateOf15YearMajor;
  dynamic _serviceDate;
  dynamic _lastServiceHours;
  dynamic _type;
  dynamic _lastEngineServiceDateAndHours;
  dynamic _nextServiceDates;
  String? _createdAt;
  String? _updatedAt;
  List<LastServiceDetails>? _lastServiceDetails;
  List<LastUpcommingServiceDetails>? _lastUpcommingServiceDetails;
  List<LastCompletedServiceDetails>? _lastCompletedServiceDetails;

  Equipment copyWith({
    int? id,
    String? createBy,
    String? customerId,
    String? machineName,
    String? unitNumber,
    String? make,
    String? model,
    String? serialNumber,
    String? dateOfManufactur,
    String? dateOfCommission,
    String? dateOf10YearMajor,
    String? dateOf15YearMajor,
    dynamic serviceDate,
    dynamic lastServiceHours,
    dynamic type,
    dynamic lastEngineServiceDateAndHours,
    dynamic nextServiceDates,
    String? createdAt,
    String? updatedAt,
    List<LastServiceDetails>? lastServiceDetails,
    List<LastUpcommingServiceDetails>? lastUpcommingServiceDetails,
    List<LastCompletedServiceDetails>? lastCompletedServiceDetails,
  }) =>
      Equipment(
        id: id ?? _id,
        createBy: createBy ?? _createBy,
        customerId: customerId ?? _customerId,
        machineName: machineName ?? _machineName,
        unitNumber: unitNumber ?? _unitNumber,
        make: make ?? _make,
        model: model ?? _model,
        serialNumber: serialNumber ?? _serialNumber,
        dateOfManufactur: dateOfManufactur ?? _dateOfManufactur,
        dateOfCommission: dateOfCommission ?? _dateOfCommission,
        dateOf10YearMajor: dateOf10YearMajor ?? _dateOf10YearMajor,
        dateOf15YearMajor: dateOf15YearMajor ?? _dateOf15YearMajor,
        serviceDate: serviceDate ?? _serviceDate,
        lastServiceHours: lastServiceHours ?? _lastServiceHours,
        type: type ?? _type,
        lastEngineServiceDateAndHours:
            lastEngineServiceDateAndHours ?? _lastEngineServiceDateAndHours,
        nextServiceDates: nextServiceDates ?? _nextServiceDates,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        lastServiceDetails: lastServiceDetails ?? _lastServiceDetails,
        lastUpcommingServiceDetails:
            lastUpcommingServiceDetails ?? _lastUpcommingServiceDetails,
        lastCompletedServiceDetails:
            lastCompletedServiceDetails ?? _lastCompletedServiceDetails,
      );

  int? get id => _id;

  String? get createBy => _createBy;

  String? get customerId => _customerId;

  String? get machineName => _machineName;

  String? get unitNumber => _unitNumber;

  String? get make => _make;

  String? get model => _model;

  String? get serialNumber => _serialNumber;

  String? get dateOfManufactur => _dateOfManufactur;

  String? get dateOfCommission => _dateOfCommission;

  String? get dateOf10YearMajor => _dateOf10YearMajor;

  String? get dateOf15YearMajor => _dateOf15YearMajor;

  dynamic get serviceDate => _serviceDate;

  dynamic get lastServiceHours => _lastServiceHours;

  dynamic get type => _type;

  dynamic get lastEngineServiceDateAndHours => _lastEngineServiceDateAndHours;

  dynamic get nextServiceDates => _nextServiceDates;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<LastServiceDetails>? get lastServiceDetails => _lastServiceDetails;

  List<LastUpcommingServiceDetails>? get lastUpcommingServiceDetails =>
      _lastUpcommingServiceDetails;

  List<LastCompletedServiceDetails>? get lastCompletedServiceDetails =>
      _lastCompletedServiceDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['create_by'] = _createBy;
    map['customer_id'] = _customerId;
    map['machine_name'] = _machineName;
    map['unit_number'] = _unitNumber;
    map['make'] = _make;
    map['model'] = _model;
    map['serial_number'] = _serialNumber;
    map['date_of_manufactur'] = _dateOfManufactur;
    map['date_of_commission'] = _dateOfCommission;
    map['date_of_10_year_major'] = _dateOf10YearMajor;
    map['date_of_15_year_major'] = _dateOf15YearMajor;
    map['service_date'] = _serviceDate;
    map['last_service_hours'] = _lastServiceHours;
    map['type'] = _type;
    map['last_engine_service_date_and_hours'] = _lastEngineServiceDateAndHours;
    map['next_service_dates'] = _nextServiceDates;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_lastServiceDetails != null) {
      map['lastServiceDetails'] =
          _lastServiceDetails?.map((v) => v.toJson()).toList();
    }
    if (_lastUpcommingServiceDetails != null) {
      map['lastUpcommingServiceDetails'] =
          _lastUpcommingServiceDetails?.map((v) => v.toJson()).toList();
    }
    if (_lastCompletedServiceDetails != null) {
      map['lastCompletedServiceDetails'] =
          _lastCompletedServiceDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class LastServiceDetails {
  LastServiceDetails({
    int? id,
    String? createBy,
    String? customerId,
    String? lastServiceDate,
    String? nextServiceDates,
    String? lastServiceReading,
    String? serviceType,
    String? attchement,
    String? notes,
    int? status,
  }) {
    _id = id;
    _createBy = createBy;
    _customerId = customerId;
    _lastServiceDate = lastServiceDate;
    _nextServiceDates = nextServiceDates;
    _lastServiceReading = lastServiceReading;
    _serviceType = serviceType;
    _attchement = attchement;
    _notes = notes;
    _status = status;
  }

  LastServiceDetails.fromJson(dynamic json) {
    _id = json['id'];
    _createBy = json['create_by'];
    _customerId = json['customer_id'];
    _lastServiceDate = json['last_service_date'];
    _nextServiceDates = json['next_service_dates'];
    _lastServiceReading = json['last_service_reading'];
    _serviceType = json['service_type'];
    _attchement = json['attchement'];
    _notes = json['notes'];
    _status = json['status'];
  }

  int? _id;
  String? _createBy;
  String? _customerId;
  String? _lastServiceDate;
  String? _nextServiceDates;
  String? _lastServiceReading;
  String? _serviceType;
  String? _attchement;
  String? _notes;
  int? _status;

  LastServiceDetails copyWith({
    int? id,
    String? createBy,
    String? customerId,
    String? lastServiceDate,
    String? nextServiceDates,
    String? lastServiceReading,
    String? serviceType,
    String? attchement,
    String? notes,
    int? status,
  }) =>
      LastServiceDetails(
        id: id ?? _id,
        createBy: createBy ?? _createBy,
        customerId: customerId ?? _customerId,
        lastServiceDate: lastServiceDate ?? _lastServiceDate,
        nextServiceDates: nextServiceDates ?? _nextServiceDates,
        lastServiceReading: lastServiceReading ?? _lastServiceReading,
        serviceType: serviceType ?? _serviceType,
        attchement: attchement ?? _attchement,
        notes: notes ?? _notes,
        status: status ?? _status,
      );

  int? get id => _id;

  String? get createBy => _createBy;

  String? get customerId => _customerId;

  String? get lastServiceDate => _lastServiceDate;

  String? get nextServiceDates => _nextServiceDates;

  String? get lastServiceReading => _lastServiceReading;

  String? get serviceType => _serviceType;

  String? get attchement => _attchement;

  String? get notes => _notes;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['create_by'] = _createBy;
    map['customer_id'] = _customerId;
    map['last_service_date'] = _lastServiceDate;
    map['next_service_dates'] = _nextServiceDates;
    map['last_service_reading'] = _lastServiceReading;
    map['service_type'] = _serviceType;
    map['service_type'] = _attchement;
    map['notes'] = _notes;
    map['status'] = _status;

    return map;
  }
}

class LastUpcommingServiceDetails {
  LastUpcommingServiceDetails({
    int? id,
    String? createBy,
    String? customerId,
    String? lastServiceDate,
    String? nextServiceDates,
    String? lastServiceReading,
    String? serviceType,
    String? attchement,
    String? notes,
    int? status,
  }) {
    _id = id;
    _createBy = createBy;
    _customerId = customerId;
    _lastServiceDate = lastServiceDate;
    _nextServiceDates = nextServiceDates;
    _lastServiceReading = lastServiceReading;
    _serviceType = serviceType;
    _attchement = attchement;
    _notes = notes;
    _status = status;
  }

  LastUpcommingServiceDetails.fromJson(dynamic json) {
    _id = json['id'];
    _createBy = json['create_by'];
    _customerId = json['customer_id'];
    _lastServiceDate = json['last_service_date'];
    _nextServiceDates = json['next_service_dates'];
    _lastServiceReading = json['last_service_reading'];
    _serviceType = json['service_type'];
    _attchement = json['attchement'];
    _notes = json['notes'];
    _status = json['status'];
  }

  int? _id;
  String? _createBy;
  String? _customerId;
  String? _lastServiceDate;
  String? _nextServiceDates;
  String? _lastServiceReading;
  String? _serviceType;
  String? _attchement;
  String? _notes;
  int? _status;

  LastUpcommingServiceDetails copyWith({
    int? id,
    String? createBy,
    String? customerId,
    String? lastServiceDate,
    String? nextServiceDates,
    String? lastServiceReading,
    String? serviceType,
    String? attchement,
    String? notes,
    int? status,
  }) =>
      LastUpcommingServiceDetails(
        id: id ?? _id,
        createBy: createBy ?? _createBy,
        customerId: customerId ?? _customerId,
        lastServiceDate: lastServiceDate ?? _lastServiceDate,
        nextServiceDates: nextServiceDates ?? _nextServiceDates,
        lastServiceReading: lastServiceReading ?? _lastServiceReading,
        serviceType: serviceType ?? _serviceType,
        attchement: attchement ?? _attchement,
        notes: notes ?? _notes,
        status: status ?? _status,
      );

  int? get id => _id;

  String? get createBy => _createBy;

  String? get customerId => _customerId;

  String? get lastServiceDate => _lastServiceDate;

  String? get nextServiceDates => _nextServiceDates;

  String? get lastServiceReading => _lastServiceReading;

  String? get serviceType => _serviceType;

  String? get attchement => _attchement;

  String? get notes => _notes;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['create_by'] = _createBy;
    map['customer_id'] = _customerId;
    map['last_service_date'] = _lastServiceDate;
    map['next_service_dates'] = _nextServiceDates;
    map['last_service_reading'] = _lastServiceReading;
    map['service_type'] = _serviceType;
    map['attchement'] = _attchement;
    map['notes'] = _notes;
    map['status'] = _status;
    return map;
  }
}

class LastCompletedServiceDetails {
  LastCompletedServiceDetails({
    int? id,
    String? createBy,
    String? customerId,
    String? lastServiceDate,
    String? nextServiceDates,
    String? lastServiceReading,
    String? serviceType,
    String? attchement,
    String? notes,
    int? status,
  }) {
    _id = id;
    _createBy = createBy;
    _customerId = customerId;
    _lastServiceDate = lastServiceDate;
    _nextServiceDates = nextServiceDates;
    _lastServiceReading = lastServiceReading;
    _serviceType = serviceType;
    _attchement = attchement;
    _notes = notes;
    _status = status;
  }

  LastCompletedServiceDetails.fromJson(dynamic json) {
    _id = json['id'];
    _createBy = json['create_by'];
    _customerId = json['customer_id'];
    _lastServiceDate = json['last_service_date'];
    _nextServiceDates = json['next_service_dates'];
    _lastServiceReading = json['last_service_reading'];
    _serviceType = json['service_type'];
    _attchement = json['attchement'];
    _notes = json['notes'];
    _status = json['status'];
  }

  int? _id;
  String? _createBy;
  String? _customerId;
  String? _lastServiceDate;
  String? _nextServiceDates;
  String? _lastServiceReading;
  String? _serviceType;
  String? _attchement;
  String? _notes;
  int? _status;

  LastCompletedServiceDetails copyWith({
    int? id,
    String? createBy,
    String? customerId,
    String? lastServiceDate,
    String? nextServiceDates,
    String? lastServiceReading,
    String? serviceType,
    String? attchement,
    String? notes,
    int? status,
  }) =>
      LastCompletedServiceDetails(
        id: id ?? _id,
        createBy: createBy ?? _createBy,
        customerId: customerId ?? _customerId,
        lastServiceDate: lastServiceDate ?? _lastServiceDate,
        nextServiceDates: nextServiceDates ?? _nextServiceDates,
        lastServiceReading: lastServiceReading ?? _lastServiceReading,
        serviceType: serviceType ?? _serviceType,
        attchement: attchement ?? _attchement,
        notes: notes ?? _notes,
        status: status ?? _status,
      );

  int? get id => _id;

  String? get createBy => _createBy;

  String? get customerId => _customerId;

  String? get lastServiceDate => _lastServiceDate;

  String? get nextServiceDates => _nextServiceDates;

  String? get lastServiceReading => _lastServiceReading;

  String? get serviceType => _serviceType;

  String? get attchement => _attchement;

  String? get notes => _notes;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['create_by'] = _createBy;
    map['customer_id'] = _customerId;
    map['last_service_date'] = _lastServiceDate;
    map['next_service_dates'] = _nextServiceDates;
    map['last_service_reading'] = _lastServiceReading;
    map['service_type'] = _serviceType;
    map['attchement'] = _attchement;
    map['notes'] = _notes;
    map['status'] = _status;

    return map;
  }
}
