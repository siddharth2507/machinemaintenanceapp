
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/routes/routes.dart';
import 'package:machinemaintainapp/services/dio_api_handler/api_worker.dart';
import 'package:machinemaintainapp/ui/login/model/login_request.dart';
import 'package:machinemaintainapp/utills/progressbar.dart';

import '../../../components/widgets/my_comman_snackbar.dart';

class LoginController extends GetxController {
  late ApiWorker apiWorker = Get.put(ApiWorker());
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  Future<void> loginApi(context) async {

    var request = LoginRequest(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
    );

    await apiWorker.loginApi(request,context)
        .then((value) {
      if (value != null) {
        print('value is ${value.data!.token}');
        SessionHelper().setLoginResponse(value);

        // CommanSnackbar.showSuccess('${value.message}');
       Get.offAllNamed(AppRoutes.bottomTab);
      }
    });
  }
}