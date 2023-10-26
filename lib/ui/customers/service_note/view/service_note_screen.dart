import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/common_components/component/common_list_view.dart';
import 'package:machinemaintainapp/common_components/component/equipment_service_container.dart';
import 'package:machinemaintainapp/common_components/component/last_service_detail_container.dart';
import 'package:machinemaintainapp/components/common_size/common_hight_width.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/customers/service_note/controller/servicenote_controller.dart';
import 'package:machinemaintainapp/utills/nk_dates_utils.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class ServiceNoteScreen extends StatefulWidget {
  const ServiceNoteScreen({super.key});

  @override
  State<ServiceNoteScreen> createState() => _ServiceNoteScreenState();
}

class _ServiceNoteScreenState extends State<ServiceNoteScreen> {
  ServiceNoteController serviceNoteController = Get.find();
  int? customer_id = 0;
  int? equipment_id = 0;
  String? manufacture = '';
  String? commission = '';
  String? tenYearMajor = '';
  String? yearMajor = '';
  String? unitNumber = '';
  String? serialNumber = '';
  String? model = '';
  String? machineName = '';
  String? make = '';
  String? galleryFile = '';
  String? type = '';
  String? date = '';
  String? companyName = '';

  @override
  void initState() {
    // TODO: implement initState
    customer_id = Get.arguments[0];
    equipment_id = Get.arguments[1];
    machineName = Get.arguments[2];
    make = Get.arguments[3];
    model = Get.arguments[4];
    serialNumber = Get.arguments[5];
    manufacture = Get.arguments[6];
    commission = Get.arguments[7];
    tenYearMajor = Get.arguments[8];
    yearMajor = Get.arguments[9];
    companyName = Get.arguments[10];
    print("customer_id>>>>${customer_id}");
    print("equipment_id>>>>${equipment_id}");
    serviceNoteController.getServiceNoteHistory(
        context, 2, customer_id!, equipment_id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appBarColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const MyRegularText(
                    label: 'Service Notes',
                    color: Colors.white,
                    fontSize: 20,
                    isSecondaryText: true,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ],
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EquipmentServiceContainer(
                companyName: companyName ?? ''.toUpperCase().toString(),
                machineName: machineName ?? ''.toUpperCase().toString(),
                make: make ?? '',
                model: model ?? '',
                serial: serialNumber ?? '',
                manufactureDate: manufacture != null
                    ? NKDateUtils().getFormattedDate(manufacture!)
                    : '',
                commissionDate: commission != null
                    ? NKDateUtils().getFormattedDate(commission!)
                    : '',
                majorDate: tenYearMajor != null
                    ? NKDateUtils().getFormattedDate(tenYearMajor!)
                    : '',
                majorDatee: yearMajor != null
                    ? NKDateUtils().getFormattedDate(yearMajor!)
                    : '',
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, left: 18, right: 18, bottom: 18),
                  child: Obx(() => serviceNoteController
                              .getServiceHistoryResponse
                              .value
                              .data
                              ?.equipment
                              ?.length !=
                          0
                      ? CommonList(
                          length: serviceNoteController
                                  .getServiceHistoryResponse
                                  .value
                                  .data
                                  ?.equipment
                                  ?.length ??
                              0,
                          physics: const NeverScrollableScrollPhysics(),
                          child: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 18.0),
                              child: MyCommnonContainer(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18.0,
                                      left: 18,
                                      right: 18,
                                      bottom: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ServiceDetailContainer(
                                        date: serviceNoteController
                                            .getServiceHistoryResponse
                                            .value
                                            .data
                                            ?.equipment![index]
                                            .lastServiceDate!=null?NKDateUtils.commonDayFormat(
                                            NKDateUtils.formatStringUTCDateTime(serviceNoteController
                                                .getServiceHistoryResponse
                                                .value
                                                .data!.equipment![index]
                                                .lastServiceDate!)):'',
                                        type: serviceNoteController
                                            .getServiceHistoryResponse
                                            .value
                                            .data
                                            ?.equipment![index]
                                            .serviceType
                                            .toString(),
                                        service: serviceNoteController
                                            .getServiceHistoryResponse
                                            .value
                                            .data
                                            ?.equipment![index]
                                            .lastServiceReading
                                            .toString(),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 18.0),
                                        child: MyCommnonContainer(
                                          color: Colors.orange.shade50,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 18.0,
                                                left: 18,
                                                right: 18,
                                                bottom: 18),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyRegularText(
                                                    label: 'Notes',
                                                    color: textColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        AppFontSize.size_8),
                                                SizedBox(
                                                  height: AppSizes.height_1_4,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 6,
                                                          left: 1,
                                                          right: 18),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Flexible(
                                                            flex: 1,
                                                            child: SizedBox(
                                                                height: AppSizes
                                                                    .height_9,
                                                                child: Image.network(serviceNoteController
                                                                        .getServiceHistoryResponse
                                                                        .value
                                                                        .data
                                                                        ?.equipment![
                                                                            index]
                                                                        .attchement ??
                                                                    '')),
                                                          ),
                                                          SizedBox(
                                                            width: AppSizes
                                                                .width_4,
                                                          ),
                                                          Flexible(
                                                            flex: 2,
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return Dialog(
                                                                          backgroundColor: Colors
                                                                              .transparent,
                                                                          child:
                                                                              Image.network(serviceNoteController.getServiceHistoryResponse.value.data?.equipment![index].attchement ?? ''));
                                                                    },
                                                                  );
                                                                });
                                                              },
                                                              child:
                                                                  MyRegularText(
                                                                label:
                                                                    '>> Click To Preview<<',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    containerTextColor,
                                                                fontSize:
                                                                    AppFontSize
                                                                        .size_10,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: AppSizes.width_4,
                                                ),
                                                MyCommnonContainer(
                                                  width: AppDimensions
                                                          .instance!.width *
                                                      1,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        MyRegularText(
                                                          label: 'Add Notes',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: AppFontSize
                                                              .size_7,
                                                        ),
                                                        const SizedBox(
                                                          height: 2,
                                                        ),
                                                        MyRegularText(
                                                          label: serviceNoteController
                                                                  .getServiceHistoryResponse
                                                                  .value
                                                                  .data
                                                                  ?.equipment![
                                                                      index]
                                                                  .notes ??
                                                              '',
                                                          maxlines: 4,
                                                          align:
                                                              TextAlign.start,
                                                          fontSize: AppFontSize
                                                              .size_10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(child: MyRegularText(label: 'No data')))),
            ],
          ),
        ),
      ),
    );
  }
}
