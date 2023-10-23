import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/services/dio_api_handler/api_worker.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/ui/customers/edit_equipment/model/edit_equipement_response.dart';
import 'package:machinemaintainapp/ui/customers/edit_equipment/model/edit_euipmnt_request.dart';
import 'package:machinemaintainapp/utills/progressbar.dart';

class EditEquipmentController extends GetxController {
  late ApiWorker apiWorker = Get.put(ApiWorker());
  TextEditingController machineNameController = TextEditingController();
  TextEditingController unitNumberController = TextEditingController();
  TextEditingController madeByController = TextEditingController();
  TextEditingController manufactureController = TextEditingController();
  TextEditingController commissionController = TextEditingController();
  TextEditingController tenYearMajorController = TextEditingController();
  TextEditingController yearMajorController = TextEditingController();
  TextEditingController lastServiceDateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController nextServiceDateController = TextEditingController();
  TextEditingController addNoteController = TextEditingController();
  TextEditingController serviceTypeController = TextEditingController();
  TextEditingController serialNumberController = TextEditingController();
  TextEditingController modelNumberController = TextEditingController();
  TextEditingController makeController = TextEditingController();

  RxList<String> serviceType =
      <String>['ENGINE SERVICE', 'ENGgINE SERVICE'].obs;
 // RxString makeTpe = 'Werner'.obs;

  var token;
  Rx<EditEquipmentResponse> editEquipmentResponse = EditEquipmentResponse().obs;

  Future<void> editCustomerEquipment(
    context,
    int id,
  ) async {
    print('id is 3 -----${id}');
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var request = EditEquipmentRequest(
        token: token ?? '',
        id: id,
        date_of_10_year_major: tenYearMajorController.text,
        date_of_15_year_major: yearMajorController.text,
        date_of_commission: commissionController.text,
        date_of_manufactur: manufactureController.text,
        machine_name: machineNameController.text,
        make: makeController.text,
        model: modelNumberController.text,
        unit_number: unitNumberController.text,
        serial_number: serialNumberController.text,
        service_date: serviceTypeController.text,
        last_service_hours: hourController.text,
        next_service_dates: nextServiceDateController.text);
    await apiWorker.editCustomerEquipment(request, context).then((value) {
      if (value != null) {
        ProgressBar.hideProgressBar();
        editEquipmentResponse.value = value;
        print('value+++12 ++ ${editEquipmentResponse.value.data.toString()}');
        Get.close(0);
      }
    });
  }
}
