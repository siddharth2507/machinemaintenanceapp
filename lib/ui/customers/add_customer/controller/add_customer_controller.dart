import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/services/dio_api_handler/api_worker.dart';
import 'package:machinemaintainapp/ui/customers/add_customer/model/add_customer_request.dart';
import 'package:machinemaintainapp/ui/customers/add_customer/model/save_customer_response.dart';
import 'package:machinemaintainapp/utills/progressbar.dart';


class AddCustomerController extends GetxController {
  late ApiWorker apiWorker = Get.put(ApiWorker());
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  var token;
  int? id;

  /// Add Customer
  Rx<SaveCustomerResponse> customerResponse = SaveCustomerResponse().obs;

  Future<SaveCustomerResponse?> addCustomer(context) async {
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var request = AddCustomerRequest(
      token: token ?? '',
      company_name: companyNameController.text,
      name: nameController.text,
      number: contactNumberController.text,
      email: emailTextEditingController.text,
      id: id,
    );
    await apiWorker.addCustomer(request, context).then((value) {
      if (value != null) {
        ProgressBar.hideProgressBar();
        customerResponse.value = value;
        print('value+++12 ++ ${customerResponse.value.data?.id.toString()}');
        return value;
        // Get.back();
      } else {
        return null;
      }
    });
    return null;
  }
}

