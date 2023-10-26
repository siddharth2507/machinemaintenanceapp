import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/services/dio_api_handler/api_worker.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/ui/history/model/get_service_history_request.dart';
import 'package:machinemaintainapp/ui/history/model/get_service_history_response.dart';

class ServiceHistoryController extends GetxController {
  late ApiWorker apiWorker = Get.put(ApiWorker());
  TextEditingController addNoteController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController searchDateController = TextEditingController();
  File? galleryFile;
  var token;

  ///Get CustomerList
  Rx<GetServiceHistoryResponse> getServiceHistoryResponse =
      GetServiceHistoryResponse().obs;

  Future<GetServiceHistoryResponse?> getServiceHistory(
      context, int status, String unit_number) async {
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var request = GetServiceHistoryRequest(
        token: token ?? '', status: status, unit_number: unit_number);
    await apiWorker.getServiceHistory(request, context).then((value) {
      if (value != null) {
        getServiceHistoryResponse.value = value;
        print('value+++123 ++ ${value.data.toString()}');
      } else {
        return null;
      }
    });
    return null;
  }

}
