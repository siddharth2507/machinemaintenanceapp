
import 'package:get/get.dart';
import 'package:machinemaintainapp/ui/customers/add_customer/controller/add_customer_controller.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/controller/add_equipment_controller.dart';
import 'package:machinemaintainapp/ui/customers/customer_detail/contoller/customer_detail_controller.dart';
import 'package:machinemaintainapp/ui/customers/edit_customer/controller/edit_customer_controller.dart';
import 'package:machinemaintainapp/ui/customers/edit_equipment/controller/edit_equipment_controller.dart';
import 'package:machinemaintainapp/ui/customers/service_note/controller/servicenote_controller.dart';
import 'package:machinemaintainapp/ui/history/controller/service_history_controller.dart';
import 'package:machinemaintainapp/ui/login/controller/login_controller.dart';
import 'package:machinemaintainapp/ui/logout/controller/logout_controller.dart';
import 'package:machinemaintainapp/ui/upcoming/controller/upcoming_service_controller.dart';
import '../services/dio_api_handler/api_worker.dart';

/// Its A Example to Use This Type Of Binding
class CommonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiWorker());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => AddCustomerController());
    Get.lazyPut(() => AddEquipmentController());
    Get.lazyPut(() => LogOutController());
    Get.lazyPut(() => EditCustomerController());
    Get.lazyPut(() => CustomerDetailController());
    Get.lazyPut(() => EditEquipmentController());
    Get.lazyPut(() => ServiceHistoryController());
    Get.lazyPut(() => ServiceNoteController());
    Get.lazyPut(() => UpcomingServiceController());
  }
}
