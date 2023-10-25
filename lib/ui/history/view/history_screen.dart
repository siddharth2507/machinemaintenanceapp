import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/common_components/component/common_list_view.dart';
import 'package:machinemaintainapp/components/widgets/my_form_field.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/routes/routes.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/history/component/history_container.dart';
import 'package:machinemaintainapp/ui/history/controller/service_history_controller.dart';
import 'package:machinemaintainapp/utills/session/nk_dates_utils.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  ServiceHistoryController serviceHistoryController = Get.find();
  String? unitNO = '';

  @override
  void initState() {
    // TODO: implement initState
    serviceHistoryController.getServiceHistory(context, 2, unitNO!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: appBarColor,
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyRegularText(
                label: 'Previous Service',
                color: Colors.white,
                fontSize: 20,
                isSecondaryText: true,
                fontWeight: FontWeight.bold,
              ),
            ],
          )),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyFormField(
                controller: serviceHistoryController.searchController,
                labelText: 'Search by unit number',
                isReadOnly: false,
                isRequire: false,
                onTap: () {
                  serviceHistoryController.getServiceHistory(context, 2,
                      serviceHistoryController.searchController.text);
                },

                //onChanged: ,
                decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/icons/search_normal.png',
                      width: 20,
                      height: 20,
                    ),
                    hintText: "Search by unit number",
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color(0xFFC57207),
                    filled: true,
                    border: InputBorder.none)),
            Obx(
                  () =>
              serviceHistoryController.getServiceHistoryResponse.value
                  .data?.equipment?.length !=
                  0
                  ? Expanded(
                child: CommonList(
                    length: serviceHistoryController
                        .getServiceHistoryResponse
                        .value
                        .data
                        ?.equipment
                        ?.length ??
                        0,
                    child: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 14.0, right: 14, top: 14),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.serviceHistory,
                                arguments: [
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .customer
                                      ?.companyName,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .equipment
                                      ?.machineName,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .equipment
                                      ?.make,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .equipment
                                      ?.model,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .equipment
                                      ?.serialNumber,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .equipment
                                      ?.dateOfManufactur,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .equipment
                                      ?.dateOfCommission,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .equipment
                                      ?.dateOf10YearMajor,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .equipment
                                      ?.dateOf15YearMajor,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .notes.toString(),
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .lastServiceDate,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .serviceType,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .lastServiceReading,
                                  serviceHistoryController
                                      .getServiceHistoryResponse
                                      .value
                                      .data
                                      ?.equipment![index]
                                      .attchement,
                                ]);
                          },
                          child: HistoryContainer(
                              machineName: serviceHistoryController
                                  .getServiceHistoryResponse
                                  .value
                                  .data
                                  ?.equipment![index]
                                  .customer
                                  ?.companyName
                                  .toString(),
                              name: serviceHistoryController
                                  .getServiceHistoryResponse
                                  .value
                                  .data
                                  ?.equipment![index]
                                  .customer
                                  ?.name
                                  .toString(),
                              unitNo: serviceHistoryController
                                  .getServiceHistoryResponse.value.data
                                  ?.equipment![index].equipment?.unitNumber
                                  .toString(),
                              type: serviceHistoryController
                                  .getServiceHistoryResponse.value.data
                                  ?.equipment![index].serviceType
                                  .toString(),
                              date: NKDateUtils.commonDayFormat(
                                  NKDateUtils.formatStringUTCDateTime(
                                      serviceHistoryController
                                          .getServiceHistoryResponse.value.data
                                          !.equipment![index].lastServiceDate!)),
                              // date: serviceHistoryController
                              //     .getServiceHistoryResponse
                              //     .value
                              //     .data
                              //     ?.equipment![index]
                              //     .lastServiceDate != null
                              //     ? DateFormat('dd/MM/yyyy').format(DateTime.parse(serviceHistoryController
                              //     .getServiceHistoryResponse.value.data
                              //     ?.equipment![index].lastServiceDate.toString())
                              //    )
                              //     : null,
                            /*  date: serviceHistoryController
                                  .getServiceHistoryResponse
                                  .value
                                  .data
                                  ?.equipment![index]
                                  .lastServiceDate
                                  .toString(),*/
                              service: serviceHistoryController
                                  .getServiceHistoryResponse
                                  .value
                                  .data
                                  ?.equipment![index]
                                  .lastServiceReading
                                  .toString(),
                              child: SvgPicture.asset(
                                  'assets/icons/arrow_right.svg')),
                        ),
                      );
                    },
                    physics: const AlwaysScrollableScrollPhysics()),
              )
                  : Center(
                child: Padding(
                  padding: EdgeInsets.only(top: AppSizes.height_40),
                  child:
                  const MyRegularText(label: 'No Data Available'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


/// date picker

// @override
// String? get restorationId => 'main';
//
//
// final RestorableDateTimeN _startDate = RestorableDateTimeN(DateTime.now().subtract(const Duration(days: 30)));
// final RestorableDateTimeN _endDate = RestorableDateTimeN(DateTime.now());
// late final RestorableRouteFuture<DateTimeRange?>_restorableDateRangePickerRouteFuture = RestorableRouteFuture<DateTimeRange?>(
//   onComplete: _selectDateRange,
//   onPresent: (NavigatorState navigator, Object? arguments) {
//     return navigator.restorablePush(_dateRangePickerRoute, arguments: <String, dynamic>{
//       'initialStartDate': _startDate.value?.millisecondsSinceEpoch,
//       'initialEndDate': _endDate.value?.millisecondsSinceEpoch,
//     });
//   },
// );
//
//
// void _selectDateRange(DateTimeRange? newSelectedDate) {
//   if (newSelectedDate != null) {
//     setState(() {
//       _startDate.value = newSelectedDate.start;
//       _endDate.value = newSelectedDate.end;
//       final DateFormat formatter = DateFormat('yyyy-MM-dd');
//       final String startformatted = formatter.format(_startDate.value!);
//       final String endformatted = formatter.format(_endDate.value!);
//       setState(() {
//         filterstartdate = startformatted;
//         filterenddate = endformatted;
//         //serviceHistoryController.getServiceHistory(context, 2);
//
//       });
//       print('date+++ ${startformatted}');
//       print('date+++ ${_endDate.value}');
//     });
//   }
// }
//
// @override
// void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//   registerForRestoration(_startDate, 'start_date');
//   registerForRestoration(_endDate, 'end_date');
//   registerForRestoration(
//       _restorableDateRangePickerRouteFuture, 'date_picker_route_future');
// }
//
// @pragma('vm:entry-point')
// static Route<DateTimeRange?> _dateRangePickerRoute(
//     BuildContext context,
//     Object? arguments,
//     ) {
//   return DialogRoute<DateTimeRange?>(
//     context: context,
//     builder: (BuildContext context) {
//       return Theme(
//         data: Theme.of(context).copyWith(
//           colorScheme: const ColorScheme.light(
//             primary: Colors.white, // header background color
//             onPrimary: Colors.black, // header text color
//             onSurface: Colors.black, // body text color
//             secondary: Colors.orange,
//             //
//           ),
//           textButtonTheme: TextButtonThemeData(
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.red, // button text color
//             ),
//           ),
//         ),
//         child: DateRangePickerDialog(
//           restorationId: 'date_picker_dialog',
//           initialDateRange: _initialDateTimeRange(arguments! as Map<dynamic, dynamic>),
//           firstDate: DateTime.now().subtract(const Duration(days: 365)),
//           lastDate: DateTime.now(),
//           initialEntryMode: DatePickerEntryMode.calendarOnly,
//         ),
//       );
//     },
//   );
// }
//
// static DateTimeRange? _initialDateTimeRange(Map<dynamic, dynamic> arguments) {
//   if (arguments['initialStartDate'] != null &&
//       arguments['initialEndDate'] != null) {
//     return DateTimeRange(
//       start: DateTime.fromMillisecondsSinceEpoch(
//           arguments['initialStartDate'] as int),
//       end: DateTime.fromMillisecondsSinceEpoch(
//           arguments['initialEndDate'] as int),
//     );
//   }
//
//   return null;
// }

}
