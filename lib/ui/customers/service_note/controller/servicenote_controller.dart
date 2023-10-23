import 'package:get/get.dart';
import 'package:machinemaintainapp/services/dio_api_handler/api_worker.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/ui/history/model/get_service_history_request.dart';
import 'package:machinemaintainapp/ui/history/model/get_service_history_response.dart';

class ServiceNoteController extends GetxController {
  late ApiWorker apiWorker = Get.put(ApiWorker());


  var token;

  ///Get CustomerList
  Rx<GetServiceHistoryResponse> getServiceHistoryResponse =
      GetServiceHistoryResponse().obs;

  Future<GetServiceHistoryResponse?> getServiceNoteHistory(
      context, int status,int customer_id,int equipment_id) async {
    await SessionHelper().getLoginResponse().then((value) {
      token = value!.data!.token;
    });
    var request = GetServiceHistoryRequest(
      token: token ?? '',
      status: status,
      customer_id:customer_id,
      equipment_id: equipment_id,


    );
    await apiWorker.getServiceHistoryNotes(request, context).then((value) {
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
