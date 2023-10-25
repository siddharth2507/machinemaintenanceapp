import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:machinemaintainapp/common_components/component/equipment_service_container.dart';
import 'package:machinemaintainapp/common_components/component/my_common_formfield.dart';
import 'package:machinemaintainapp/common_components/component/last_service_detail_container.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/history/controller/service_history_controller.dart';
import 'package:machinemaintainapp/utills/session/nk_dates_utils.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class ServiceHistoryScreen extends StatefulWidget {
  const ServiceHistoryScreen({super.key});

  @override
  State<ServiceHistoryScreen> createState() => _ServiceHistoryScreenState();
}

class _ServiceHistoryScreenState extends State<ServiceHistoryScreen> {
  ServiceHistoryController serviceHistoryController = Get.find();

  final picker = ImagePicker();
  bool isVisible = true;
  String? companyName = '';
  String? service = '';
  int cutomer_id = 0;
  int equipment_id = 0;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    companyName = Get.arguments[0];
    machineName = Get.arguments[1];
    make = Get.arguments[2];
    model = Get.arguments[3];
    serialNumber = Get.arguments[4];
    manufacture = Get.arguments[5];
    commission = Get.arguments[6];
    tenYearMajor = Get.arguments[7];
    yearMajor = Get.arguments[8];
    serviceHistoryController.addNoteController.text = Get.arguments[9];
    date = Get.arguments[10];
    type = Get.arguments[11];
    service = Get.arguments[12];
    galleryFile = Get.arguments[13];
    print('filePAth>>>>${galleryFile}');
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
                    label: 'History Detail',
                    color: Colors.white,
                    fontSize: 20,
                    isSecondaryText: true,
                    fontWeight: FontWeight.bold,
                  ),
                  SvgPicture.asset('assets/icons/document.svg'),
                ],
              ),
            ],
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EquipmentServiceContainer(
                companyName: companyName?.toUpperCase() ?? '',
                machineName: machineName?.toUpperCase() ?? '',
                make: make ?? '',
                model: model ?? '',
                serial: serialNumber ?? '',
                manufactureDate: NKDateUtils.commonDayFormat(
                    NKDateUtils.formatStringUTCDateTime(manufacture ?? '')),
                commissionDate: commission != null
                    ? NKDateUtils.commonDayFormat(
                        NKDateUtils.formatStringUTCDateTime(commission ?? ''))
                    : '',
                majorDate: tenYearMajor != null
                    ? NKDateUtils.commonDayFormat(
                        NKDateUtils.formatStringUTCDateTime(tenYearMajor ?? ''))
                    : '',
                majorDatee: yearMajor != null
                    ? NKDateUtils.commonDayFormat(
                        NKDateUtils.formatStringUTCDateTime(yearMajor ?? ''))
                    : '',
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, left: 18, right: 18, bottom: 18),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: MyCommnonContainer(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 18.0, left: 18, right: 18, bottom: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ServiceDetailContainer(
                              date: date != null
                                  ? NKDateUtils.commonDayFormat(
                                      NKDateUtils.formatStringUTCDateTime(
                                          date ?? ''))
                                  : '',
                              type: type ?? '',
                              service: service ?? '',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: MyCommnonContainer(
                                color: Colors.orange.shade50,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18.0, left: 2, right: 2, bottom: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18.0),
                                        child: MyRegularText(
                                            label: 'Notes',
                                            color: textColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: AppFontSize.size_8),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6, left: 18, right: 18),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: SizedBox(
                                                      height: AppSizes.height_9,
                                                      child: Image.network(
                                                          galleryFile ?? '')),
                                                ),
                                                SizedBox(
                                                  width: AppSizes.width_4,
                                                ),
                                                Flexible(
                                                  flex: 2,
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return Dialog(
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              child: Image.network(
                                                                  galleryFile ??
                                                                      ''),
                                                            );
                                                          },
                                                        );
                                                      });
                                                    },
                                                    child: MyRegularText(
                                                      label:
                                                          '>> Click To Preview<<',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: containerTextColor,
                                                      fontSize:
                                                          AppFontSize.size_10,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: AppSizes.height_1_4,
                                            ),
                                            MyCommonFormField(
                                                isReadOnly: true,
                                                controller:
                                                    serviceHistoryController
                                                        .addNoteController,
                                                hintText: 'Add Notes')
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: AppSizes.height_3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
