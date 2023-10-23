
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:machinemaintainapp/general_binding/common_binding.dart';
import 'package:machinemaintainapp/ui/bottom_tab/bottom_tab.dart';
import 'package:machinemaintainapp/ui/customers/add_customer/view/add_customer_screen.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/view/add_equipment_screen.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/view/equipment_service_screen.dart';
import 'package:machinemaintainapp/ui/customers/customer_detail/view/customer_detail_screen.dart';
import 'package:machinemaintainapp/ui/customers/customer_list/view/customer_list_screen.dart';
import 'package:machinemaintainapp/ui/customers/edit_customer/view/edit_customer_screen.dart';
import 'package:machinemaintainapp/ui/customers/edit_equipment/view/edit_equipment_screen.dart';
import 'package:machinemaintainapp/ui/customers/service_note/view/service_note_screen.dart';
import 'package:machinemaintainapp/ui/history/view/history_screen.dart';
import 'package:machinemaintainapp/ui/history/view/service_history_screen.dart';
import 'package:machinemaintainapp/ui/login/view/login_screen.dart';
import 'package:machinemaintainapp/ui/logout/view/logout_screen.dart';
import 'package:machinemaintainapp/ui/upcoming/view/upcoming_detail_screen.dart';
import 'package:machinemaintainapp/ui/upcoming/view/upcoming_screen.dart';

import '../ui/splash/splash_screen.dart';

class AppRoutes {
  static const String initialRoutes = "/";
  static const String splash = "/splash";
  static const String login = "/login";
  static const String bottomTab = "/bottomTab";
  static const String customer = "/customer";
  static const String customerDetail = "/customerDetail";
  static const String history = "/history";
  static const String upComing = "/upComing";
  static const String addEquipment = "/addEquipment";
  static const String addCustomer = "/addCustomer";
  static const String editCustomer = "/editCustomer";
  static const String equipmentService = "/equipmentService";
  static const String editEquipment = "/editEquipment";
  static const String serviceNote = "/serviceNote";
  static const String serviceHistory = "/serviceHistory";
  static const String upcomingDetailScreen = "/upcomingDetailScreen";
  static const String logOut = "/logOut";



  static List<GetPage<dynamic>> get generatedRoutes => [
        GetPage(name: splash, page: () => SplashScreen(),),
        GetPage(name: login, page: () => const LoginScreen(),binding: CommonBinding()),
        GetPage(name: bottomTab, page: () => const BottomTab(),binding: CommonBinding()),
        GetPage(name: customer, page: () => const CustomerScreen(),binding: CommonBinding()),
        GetPage(name: customerDetail, page: () => const CustomerDetailScreen(),binding: CommonBinding()),
        GetPage(name: history, page: () => const HistoryScreen(),binding: CommonBinding()),
        GetPage(name: upComing, page: () => const UpComingScreen(),binding: CommonBinding()),
        GetPage(name: addEquipment, page: () => const AddEquipmentScreen(),binding: CommonBinding()),
        GetPage(name: addCustomer, page: () => const AddCustomerScreen(),binding: CommonBinding()),
        GetPage(name: editCustomer, page: () => const EditCustomerScreen(),binding: CommonBinding()),
        GetPage(name: editEquipment, page: () => const EditEquipmentScreen(),binding: CommonBinding()),
        GetPage(name: equipmentService, page: () => const EquipmentServiceScreen(),binding: CommonBinding()),
        GetPage(name: serviceNote, page: () => const ServiceNoteScreen(),binding: CommonBinding()),
        GetPage(name: serviceHistory, page: () => const ServiceHistoryScreen(),binding: CommonBinding()),
        GetPage(name: upcomingDetailScreen, page: () => const UpcomingDetailScreen(),binding: CommonBinding()),
        GetPage(name: logOut, page: () => const LogOutScreen(),binding: CommonBinding()),


      ];
}
