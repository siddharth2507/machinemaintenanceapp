import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/services/dio_api_handler/api_worker.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/session/session_manager.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/model/save_service_history_request.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/model/save_service_history_response.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/model/add_equipment_response.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/model/add_euipmnt_request.dart';
import 'package:machinemaintainapp/ui/delete_equipment/model/delete_equipment_request.dart';
import 'package:machinemaintainapp/ui/delete_equipment/model/delete_equipment_response.dart';
import 'package:machinemaintainapp/utills/progressbar.dart';
import 'package:machinemaintainapp/utills/nk_dates_utils.dart';
import '../../../../utills/utils.dart';
import '../model/save_service_upcoming_request.dart';

class AddEquipmentController extends GetxController {
  late ApiWorker apiWorker = Get.put(ApiWorker());
  TextEditingController machineNameController = TextEditingController();
  TextEditingController unitNumberController = TextEditingController();
  TextEditingController madeByController = TextEditingController();
  TextEditingController manufactureController = TextEditingController();
  TextEditingController commissionController = TextEditingController();
  TextEditingController tenYearMajorController = TextEditingController();
  TextEditingController yearMajorController = TextEditingController();
  TextEditingController serviceTypeController = TextEditingController();
  TextEditingController serialNumberController = TextEditingController();
  TextEditingController modelNumberController = TextEditingController();
  TextEditingController lastServiceDateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController nextServiceDateController = TextEditingController();
  TextEditingController addNoteController = TextEditingController();
  TextEditingController mAkeController = TextEditingController();
  RxString service = 'Engine Service'.obs;
  File? galleryFile;

  // RxString makeTpe = 'Werner'.obs;

  var token;

  ///Add Equipment
  Rx<AddEquipmentResponse> addEquipmentResponse = AddEquipmentResponse().obs;

  Future<AddEquipmentResponse?> addCustomerEquipment(
      context, int customer_id) async {
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var request = AddEquipmentRequest(
      token: token ?? '',
      customer_id: customer_id,
      date_of_10_year_major: tenYearMajorController.text,
      date_of_15_year_major: yearMajorController.text,
      date_of_commission: commissionController.text,
      date_of_manufactur: manufactureController.text,
      machine_name: machineNameController.text,
      make: mAkeController.text,
      model: modelNumberController.text,
      unit_number: unitNumberController.text,
      serial_number: serialNumberController.text,
      service_date: serviceTypeController.text,
      type: service.value,
      last_service_reading: hourController.text,
      next_service_dates: nextServiceDateController.text,
    );
    await apiWorker.addCustomerEquipment(request, context).then((value) {
      if (value != null) {
        // SessionHelper().setCustomerData(value.data.length);
        ProgressBar.hideProgressBar();
        addEquipmentResponse.value = value;
        print(
            'value+++12 ++ ${addEquipmentResponse.value.data?.id.toString()}');
        //Get.close(0);
      } else {
        return null;
      }
    });
    return addEquipmentResponse.value;
  }

  /// Delete Equipment
  Rx<DeleteEquipmentResponse> deleteEquipmentResponse =
      DeleteEquipmentResponse().obs;

  Future<void> deleteCustomerEquipment(context, int id) async {
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var request = DeleteEquipmentRequest(
      token: token ?? '',
      id: id,
    );
    await apiWorker.deleteCustomerEquipment(request, context).then((value) {
      if (value != null) {
        // SessionHelper().setCustomerData(value.data.length);
        ProgressBar.hideProgressBar();
        deleteEquipmentResponse.value = value;
        print('value+++12 ++ ${deleteEquipmentResponse.value.data.toString()}');
        SessionManager.clearData();
        Get.close(1);
      }
    });
  }

  /// save Service FirstTime
  Future<SaveServiceHistoryResponse> saveServiceHistoryFirstTime(
      context, int custome_id, int equipment_id, int type) async {
    var request;
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var date = DateTime.now();
    var apinext3monthdate =
        NKDateUtils.apiDayFormat(DateTime(date.year, date.month + 3, date.day));
    print("API_NEXT $apinext3monthdate");

    request = SaveServiceUpcomingRequest(
        token: token ?? '',
        next_service_dates:
            type == 0 ? nextServiceDateController.text : apinext3monthdate,
        customer_id: custome_id,
        equipment_id: equipment_id);

    await apiWorker.saveServiceUpcoming(request, context).then((value) {
      if (value != null) {
        print('third++ in ');
        ProgressBar.hideProgressBar();
        saveServiceHistoryResponse.value = value;
        print(
            'value+++12 ++ ${saveServiceHistoryResponse.value.data.toString()}');
        return saveServiceHistoryResponse.value;
      } else {
        return null;
      }
    });
    return saveServiceHistoryResponse.value;
  }

  ///Add Service
  Rx<SaveServiceHistoryResponse> saveServiceHistoryResponse =
      SaveServiceHistoryResponse().obs;

  Future<void> saveServiceHistory(
      context, int custome_id, int equipment_id, int serviceId) async {
    var request;
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var image;
    image = await Utils.getFormData(galleryFile!.path, mapKeyName: '');
    if (serviceId == 0) {
      request = SaveServiceHistoryRequest(
          token: token ?? '',
          next_service_dates: nextServiceDateController.text,
          last_service_reading: hourController.text,
          last_service_date: lastServiceDateController.text,
          notes: addNoteController.text,
          service_type: service.value,
          customer_id: custome_id,
          equipment_id: equipment_id,
          attchement: image);
    } else {
      request = SaveServiceHistoryRequest(
          id: serviceId,
          token: token ?? '',
          next_service_dates: nextServiceDateController.text,
          last_service_reading: hourController.text,
          last_service_date: lastServiceDateController.text,
          notes: addNoteController.text,
          service_type: service.value,
          customer_id: custome_id,
          equipment_id: equipment_id,
          attchement: image);
    }

    await apiWorker.saveServiceHistory(request, context).then((value) {
      if (value != null) {
        print('first++ in ');
        ProgressBar.hideProgressBar();
        saveServiceHistoryResponse.value = value;
        print(
            'value+++12 ++ ${saveServiceHistoryResponse.value.data.toString()}');
        //  Get.back();
      }
    });
  }
}
