import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/services/dio_api_handler/api_worker.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/ui/history/model/get_service_history_request.dart';
import 'package:machinemaintainapp/ui/history/model/get_service_history_response.dart';

class UpcomingServiceController extends GetxController {
  late ApiWorker apiWorker = Get.put(ApiWorker());
  TextEditingController addNoteController = TextEditingController();
  TextEditingController searchDateController = TextEditingController();
  File? galleryFile;
  var token;

  ///Get CustomerList
  Rx<GetServiceHistoryResponse> getServiceHistoryResponse =
      GetServiceHistoryResponse().obs;

  Future<GetServiceHistoryResponse?> getUpcomingServiceHistory(
      context, int status, String filterstartdate, String filterenddate) async {
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var request = GetServiceHistoryRequest(
        token: token ?? '',
        status: status,
        start_date: filterstartdate,
        end_date: filterenddate);
    await apiWorker.getUpcomingServiceHistory(request, context).then((value) {
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
