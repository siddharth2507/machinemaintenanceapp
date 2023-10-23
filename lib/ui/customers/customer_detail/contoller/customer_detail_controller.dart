import 'package:get/get.dart';
import 'package:machinemaintainapp/services/dio_api_handler/api_worker.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/ui/customers/customer_detail/model/equipment_request.dart';
import 'package:machinemaintainapp/ui/customers/customer_detail/model/equipment_response.dart';
import 'package:machinemaintainapp/ui/customers/delete_customer/model/delete_customer_request.dart';
import 'package:machinemaintainapp/ui/customers/delete_customer/model/delete_customer_response.dart';
import 'package:machinemaintainapp/ui/delete_equipment/model/delete_equipment_request.dart';
import 'package:machinemaintainapp/ui/delete_equipment/model/delete_equipment_response.dart';
import 'package:machinemaintainapp/utills/progressbar.dart';

class CustomerDetailController extends GetxController {
  late ApiWorker apiWorker = Get.put(ApiWorker());

  var token;

  ///getCustomerEquipment
  Rx<EquipmentResponse> equipmentResponse = EquipmentResponse().obs;

  Future<void> customerEquipment(context, int customer_id) async {
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var request = EquipmentRequest(
      token: token ?? '',
      customer_id: customer_id,
    );
    await apiWorker.customerEquipment(request, context).then((value) {
      if (value != null) {
        equipmentResponse.value = value;
        // Get.close(0);
      }
    });
  }

  ///Delete Customer
  Rx<DeleteCustomerResponse> deleteCustomerResponse =
      DeleteCustomerResponse().obs;

  Future<void> deleteCustomer(context, int id) async {
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var request = DeleteCustomerRequest(
      token: token ?? '',
      id: id,
    );
    await apiWorker.deleteCustomer(request, context).then((value) {
      if (value != null) {
        ProgressBar.hideProgressBar();
        deleteCustomerResponse.value = value;
        Get.close(0);
      }
    });
  }

  ///Delete Customer Equipment
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
        ProgressBar.hideProgressBar();
        deleteEquipmentResponse.value = value;
        Get.close(0);
      }
    });
  }
}
