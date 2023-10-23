import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:machinemaintainapp/ui/customers/add_customer/model/add_customer_request.dart';
import 'package:machinemaintainapp/ui/customers/add_customer/model/save_customer_response.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/model/save_service_history_request.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/model/save_service_history_response.dart';
import 'package:machinemaintainapp/ui/customers/customer_detail/model/equipment_request.dart';
import 'package:machinemaintainapp/ui/customers/customer_detail/model/equipment_response.dart';
import 'package:machinemaintainapp/ui/customers/customer_list/model/customer_response.dart';
import 'package:machinemaintainapp/ui/customers/customer_list/model/get_customer_request.dart';
import 'package:machinemaintainapp/ui/customers/delete_customer/model/delete_customer_request.dart';
import 'package:machinemaintainapp/ui/customers/delete_customer/model/delete_customer_response.dart';
import 'package:machinemaintainapp/ui/customers/edit_customer/model/edit_customer_request.dart';
import 'package:machinemaintainapp/ui/customers/edit_customer/model/edit_customer_response.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/model/add_equipment_response.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/model/add_euipmnt_request.dart';
import 'package:machinemaintainapp/ui/customers/edit_equipment/model/edit_equipement_response.dart';
import 'package:machinemaintainapp/ui/customers/edit_equipment/model/edit_euipmnt_request.dart';
import 'package:machinemaintainapp/ui/delete_equipment/model/delete_equipment_request.dart';
import 'package:machinemaintainapp/ui/delete_equipment/model/delete_equipment_response.dart';
import 'package:machinemaintainapp/ui/history/model/get_service_history_request.dart';
import 'package:machinemaintainapp/ui/history/model/get_service_history_response.dart';
import 'package:machinemaintainapp/ui/login/model/login_request.dart';
import 'package:machinemaintainapp/ui/login/model/login_response.dart';
import 'package:machinemaintainapp/utills/progressbar.dart';
import 'api_constants.dart';
import 'dio_client.dart';

class ApiWorker with ApiConstants {
  late DioClient dio;

  ApiWorker() {
    dio = DioClient();
  }

  ///login
  Future<LoginResponse?> loginApi(LoginRequest loginRequest, context) async {
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .postbycustom(
      ApiConstants.loginUrl,
      data: FormData.fromMap(loginRequest.toJson()),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return LoginResponse.fromJson(response.data);
  }

  /// get customer list
  Future<CustomerResponse?> customerApi(
      GetCustomerRequest getCustomerRequest, context) async {
    print('token ============== ${getCustomerRequest.token}');
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .getbycustom(
      ApiConstants.getCustomerUrl,
      options: Options(
        headers: {
          "authorization": "Bearer ${getCustomerRequest.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return CustomerResponse.fromJson(response.data);
  }

  ///add Customer Data
  Future<SaveCustomerResponse?> addCustomer(
      AddCustomerRequest model, context) async {
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .postbycustom(
      ApiConstants.saveCustomerUrl,
      data: FormData.fromMap(model.toJson()),
      options: Options(
        headers: {
          "authorization": "Bearer ${model.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return SaveCustomerResponse.fromJson(response.data);
  }

  ///Edit Customer
  Future<EditCustomerResponse?> editCustomer(
      EditCustomerRequest model, context) async {
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .postbycustom(
      ApiConstants.editCustomerUrl,
      data: FormData.fromMap(model.toJson()),
      options: Options(
        headers: {
          "authorization": "Bearer ${model.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return EditCustomerResponse.fromJson(response.data);
  }

  ///Delete Customer
  Future<DeleteCustomerResponse?> deleteCustomer(
      DeleteCustomerRequest model, context) async {
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .postbycustom(
      ApiConstants.deleteCustomerUrl,
      data: FormData.fromMap(model.toJson()),
      options: Options(
        headers: {
          "authorization": "Bearer ${model.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return DeleteCustomerResponse.fromJson(response.data);
  }

  ///Get Customer Equipment
  Future<EquipmentResponse?> customerEquipment(
      EquipmentRequest model, context) async {
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .postbycustom(
      ApiConstants.customerEquipmentUrl,
      data: FormData.fromMap(model.toJson()),
      options: Options(
        headers: {
          "authorization": "Bearer ${model.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return EquipmentResponse.fromJson(response.data);
  }

  ///Add Customer Equipment
  Future<AddEquipmentResponse?> addCustomerEquipment(
      AddEquipmentRequest model, context) async {
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .postbycustom(
      ApiConstants.addEquipmentUrl,
      data: FormData.fromMap(model.toJson()),
      options: Options(
        headers: {
          "authorization": "Bearer ${model.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return AddEquipmentResponse.fromJson(response.data);
  }

  ///Delete Customer Equipment
  Future<DeleteEquipmentResponse?> deleteCustomerEquipment(
      DeleteEquipmentRequest model, context) async {
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .postbycustom(
      ApiConstants.deleteEquipmentUrl,
      data: FormData.fromMap(model.toJson()),
      options: Options(
        headers: {
          "authorization": "Bearer ${model.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return DeleteEquipmentResponse.fromJson(response.data);
  }

  ///Edit Customer Equipment
  Future<EditEquipmentResponse?> editCustomerEquipment(
      EditEquipmentRequest model, context) async {
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .postbycustom(
      ApiConstants.editEquipmentUrl,
      data: FormData.fromMap(model.toJson()),
      options: Options(
        headers: {
          "authorization": "Bearer ${model.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return EditEquipmentResponse.fromJson(response.data);
  }

  /// get Service Note History
  Future<GetServiceHistoryResponse?> getServiceHistoryNotes(
      GetServiceHistoryRequest getServiceHistoryRequest, context) async {
    print('token ============== ${getServiceHistoryRequest.token}');
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .getbycustom(
     // '${ApiConstants.getHistoryUrl}?customer_id=${getServiceHistoryRequest.customer_id}',
      '${ApiConstants.getHistoryUrl}?status=${getServiceHistoryRequest.status}&customer_id=${getServiceHistoryRequest.customer_id}&equipment_id=${getServiceHistoryRequest.equipment_id}',
      options: Options(
        headers: {
          "authorization": "Bearer ${getServiceHistoryRequest.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return GetServiceHistoryResponse.fromJson(response.data);
  }
  /// get  Service History
  Future<GetServiceHistoryResponse?> getServiceHistory(
      GetServiceHistoryRequest getServiceHistoryRequest, context) async {
    print('token ============== ${getServiceHistoryRequest.token}');
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .getbycustom(
      '${ApiConstants.getHistoryUrl}?status=${getServiceHistoryRequest.status}&unit_number=${getServiceHistoryRequest.unit_number}',
      options: Options(
        headers: {
          "authorization": "Bearer ${getServiceHistoryRequest.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return GetServiceHistoryResponse.fromJson(response.data);
  }

  /// get Upcoming Service History
  Future<GetServiceHistoryResponse?> getUpcomingServiceHistory(
      GetServiceHistoryRequest getServiceHistoryRequest, context) async {
    print('token ============== ${getServiceHistoryRequest.token}');
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .getbycustom(
      '${ApiConstants.getHistoryUrl}?status=${getServiceHistoryRequest.status}&start_date=${getServiceHistoryRequest.start_date}&end_date=${getServiceHistoryRequest.end_date}',
      options: Options(
        headers: {
          "authorization": "Bearer ${getServiceHistoryRequest.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return GetServiceHistoryResponse.fromJson(response.data);
  }

  ///Save/Edit Service History
  Future<SaveServiceHistoryResponse?> saveServiceHistory(
      SaveServiceHistoryRequest model, context) async {
    ProgressBar.showProgressBarApi(context);
    final response = await dio
        .postbycustom(
      ApiConstants.saveHistoryUrl,
      data: FormData.fromMap(model.toJson()),
      options: Options(
        headers: {
          "authorization": "Bearer ${model.token}",
        },
      ),
    )
        .onError((DioException error, stackTrace) {
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    ProgressBar.hideProgressBar();
    return SaveServiceHistoryResponse.fromJson(response.data);
  }
}
