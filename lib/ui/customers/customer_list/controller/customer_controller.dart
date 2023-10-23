import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/general_binding/common_binding.dart';
import 'package:machinemaintainapp/routes/routes.dart';
import 'package:machinemaintainapp/services/dio_api_handler/api_worker.dart';
import 'package:machinemaintainapp/ui/customers/customer_list/model/customer_response.dart';
import 'package:machinemaintainapp/ui/customers/customer_list/model/get_customer_request.dart';
import 'package:machinemaintainapp/ui/customers/customer_list/view/customer_list_screen.dart';
import 'package:machinemaintainapp/ui/history/view/history_screen.dart';
import 'package:machinemaintainapp/ui/upcoming/view/upcoming_screen.dart';

class CustomerController extends GetxController {
  late ApiWorker apiWorker = Get.put(ApiWorker());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  RxBool passwordShow = true.obs;
  RxBool isChecked = false.obs;
  RxString deviceId = ''.obs;
  RxString deviceType = ''.obs;

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRoutes.customer) {
      return GetPageRoute(
        settings: settings,
        page: () => const CustomerScreen(),
        binding: CommonBinding(),
      );
    }
    if (settings.name == AppRoutes.history) {
      return GetPageRoute(
        settings: settings,
        page: () => const HistoryScreen(),
        binding: CommonBinding(),
      );
    }
    if (settings.name == AppRoutes.upComing) {
      return GetPageRoute(
        settings: settings,
        page: () => const UpComingScreen(),
        binding: CommonBinding(),
      );
    }

    return null;
  }

  var token;

  ///Get CustomerList
  Rx<CustomerResponse> customerResponse = CustomerResponse().obs;

  Future<void> customerApi(context) async {
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var request = GetCustomerRequest(token: token ?? '');
    await apiWorker.customerApi(request, context).then((value) {
      if (value != null) {
        customerResponse.value = value;
        print(
            'value+++123 ++ ${customerResponse.value.data!.customers?.length.toString()}');
      }
    });
  }
}
