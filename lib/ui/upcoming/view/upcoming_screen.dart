import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:machinemaintainapp/common_components/component/common_list_view.dart';
import 'package:machinemaintainapp/components/widgets/my_form_field.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/routes/routes.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/upcoming/component/upcoming_container.dart';
import 'package:machinemaintainapp/ui/upcoming/controller/upcoming_service_controller.dart';
import 'package:machinemaintainapp/utills/nk_dates_utils.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class UpComingScreen extends StatefulWidget {
  const UpComingScreen({super.key});

  @override
  State<UpComingScreen> createState() => _UpComingScreenState();
}

class _UpComingScreenState extends State<UpComingScreen> with RestorationMixin {
  UpcomingServiceController upcomingServiceController = Get.find();
  String? filterstartdate = '';
  String? filterenddate = '';

  @override
  void initState() {
    // TODO: implement initState
    filterstartdate.toString();
    upcomingServiceController.getUpcomingServiceHistory(
        context, 1, filterstartdate!, filterenddate!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          //  centerTitle: false,
          backgroundColor: appBarColor,
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyRegularText(
                label: 'Upcoming Service',
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
                controller: upcomingServiceController.searchDateController,
                labelText: 'Search by Date',
                isRequire: false,
                isReadOnly: true,
                onTap: () {
                  setState(() {
                    _restorableDateRangePickerRouteFuture.present();
                  });
                },
                // textInputType: TextInputType.number,
                //onChanged: ,
                decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      width: 10,
                      height: 10,
                      child: Image.asset(
                        'assets/icons/calendar.png',
                        color: Colors.white,
                      ),
                    ),
                    hintText: "Search by date",
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color(0xFFC57207),
                    filled: true,
                    border: InputBorder.none)),
            Obx(
              () => upcomingServiceController.getServiceHistoryResponse.value
                          .data?.equipment?.length !=
                      0
                  ? Expanded(
                      child: CommonList(
                          length: upcomingServiceController
                                  .getServiceHistoryResponse
                                  .value
                                  .data
                                  ?.equipment
                                  ?.length ??
                              0,
                          child: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0, top: 14, right: 14),
                              child: InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.upcomingDetailScreen,
                                        arguments: [
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .customer
                                              ?.companyName,
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .equipment
                                              ?.machineName,
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .equipment
                                              ?.make,
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .equipment
                                              ?.model,
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .equipment
                                              ?.serialNumber,
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .equipment
                                              ?.dateOfManufactur,
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .equipment
                                              ?.dateOfCommission,
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .equipment
                                              ?.dateOf10YearMajor,
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .equipment
                                              ?.dateOf15YearMajor,
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .notes
                                              .toString(),
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .lastServiceDate,
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .serviceType,
                                          upcomingServiceController
                                              .getServiceHistoryResponse
                                              .value
                                              .data
                                              ?.equipment![index]
                                              .lastServiceReading,
                                        ]);
                                  },
                                  child: UpComingContainer(
                                    machineName: upcomingServiceController
                                        .getServiceHistoryResponse
                                        .value
                                        .data
                                        ?.equipment![index]
                                        .customer
                                        ?.companyName,
                                    name: upcomingServiceController
                                        .getServiceHistoryResponse
                                        .value
                                        .data
                                        ?.equipment![index]
                                        .customer
                                        ?.name
                                        .toString(),
                                    unitNo: upcomingServiceController
                                        .getServiceHistoryResponse
                                        .value
                                        .data
                                        ?.equipment![index]
                                        .equipment
                                        ?.unitNumber
                                        .toString(),
                                    nextService: NKDateUtils.commonDayFormat(
                                        NKDateUtils.formatStringUTCDateTime(
                                            upcomingServiceController
                                                .getServiceHistoryResponse
                                                .value
                                                .data!
                                                .equipment![index]
                                                .nextServiceDates
                                                .toString())),
                                    child: SvgPicture.asset(
                                        'assets/icons/arrow_right.svg'),
                                  )),
                            );
                          },
                          physics: const AlwaysScrollableScrollPhysics()),
                    )
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: AppSizes.height_40),
                        child: const MyRegularText(label: 'No Data Available'),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  @override
  String? get restorationId => 'main';

  final RestorableDateTimeN _startDate =
      RestorableDateTimeN(DateTime.now().subtract(const Duration(days: 30)));
  final RestorableDateTimeN _endDate = RestorableDateTimeN(DateTime.now());
  late final RestorableRouteFuture<DateTimeRange?>
      _restorableDateRangePickerRouteFuture =
      RestorableRouteFuture<DateTimeRange?>(
    onComplete: _selectDateRange,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator
          .restorablePush(_dateRangePickerRoute, arguments: <String, dynamic>{
        'initialStartDate': _startDate.value?.millisecondsSinceEpoch,
        'initialEndDate': _endDate.value?.millisecondsSinceEpoch,
      });
    },
  );

  void _selectDateRange(DateTimeRange? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _startDate.value = newSelectedDate.start;
        _endDate.value = newSelectedDate.end;
        final DateFormat formatter = DateFormat('yyyy/MM/dd');
        final String startformatted = formatter.format(_startDate.value!);
        final String endformatted = formatter.format(_endDate.value!);
        setState(() {
          filterstartdate = startformatted;
          filterenddate = endformatted;
          upcomingServiceController.searchDateController.text =
              '${filterstartdate}-${filterenddate}';
          upcomingServiceController.getUpcomingServiceHistory(
              context, 1, filterstartdate!, filterenddate!);
        });
        print('date+++ ${startformatted}');
        print('date+++ ${_endDate.value!}');
      });
    }
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_startDate, 'start_date');
    registerForRestoration(_endDate, 'end_date');
    registerForRestoration(
        _restorableDateRangePickerRouteFuture, 'date_picker_route_future');
  }

  @pragma('vm:entry-point')
  static Route<DateTimeRange?> _dateRangePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTimeRange?>(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black12, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black, // body text color
              secondary: Colors.orange,
              //
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
          ),
          child: DateRangePickerDialog(
            restorationId: 'date_picker_dialog',
            initialDateRange:
                _initialDateTimeRange(arguments! as Map<dynamic, dynamic>),
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime(2024),
            initialEntryMode: DatePickerEntryMode.calendarOnly,
          ),
        );
      },
    );
  }

  static DateTimeRange? _initialDateTimeRange(Map<dynamic, dynamic> arguments) {
    if (arguments['initialStartDate'] != null &&
        arguments['initialEndDate'] != null) {
      return DateTimeRange(
        start: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialStartDate'] as int),
        end: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialEndDate'] as int),
      );
    }
    return null;
  }
}
