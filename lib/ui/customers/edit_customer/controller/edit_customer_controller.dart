import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/services/dio_api_handler/api_worker.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/ui/customers/edit_customer/model/edit_customer_request.dart';
import 'package:machinemaintainapp/ui/customers/edit_customer/model/edit_customer_response.dart';
import 'package:machinemaintainapp/utills/progressbar.dart';

class EditCustomerController extends GetxController {
  late ApiWorker apiWorker = Get.put(ApiWorker());
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  var token;

  /// Edit Customer
  Rx<EditCustomerResponse> editCustomerResponse = EditCustomerResponse().obs;

  Future<void> editCustomer(context, int id) async {
    print('id is 3 -----${id}');
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var request = EditCustomerRequest(
      token: token ?? '',
      company_name: companyNameController.text,
      name: nameController.text,
      number: contactNumberController.text,
      email: emailController.text,
      id: id,
    );
    await apiWorker.editCustomer(request, context).then((value) {
      if (value != null) {
        ProgressBar.hideProgressBar();
        editCustomerResponse.value = value;
        print('value+++12 ++ ${editCustomerResponse.value.data.toString()}');
        Get.close(1);
      }
    });
  }
}
