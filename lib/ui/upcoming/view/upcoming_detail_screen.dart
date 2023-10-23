import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:machinemaintainapp/common_components/component/common_list_view.dart';
import 'package:machinemaintainapp/common_components/component/equipment_service_container.dart';
import 'package:machinemaintainapp/common_components/component/my_common_formfield.dart';
import 'package:machinemaintainapp/common_components/component/last_service_detail_container.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/history/controller/service_history_controller.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class UpcomingDetailScreen extends StatefulWidget {
  const UpcomingDetailScreen({super.key});

  @override
  State<UpcomingDetailScreen> createState() => _UpcomingDetailScreenState();
}

class _UpcomingDetailScreenState extends State<UpcomingDetailScreen> {
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
    date = Get.arguments[10];
    type = Get.arguments[11];
    service = Get.arguments[12];
    serviceHistoryController.addNoteController.text = Get.arguments[9];
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
                    label: 'Upcoming Detail',
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
                manufactureDate: manufacture ?? '',
                commissionDate: commission ?? '',
                majorDate: tenYearMajor ?? '',
                majorDatee: yearMajor ?? '',
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
                              date: date ?? '',
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
                                            /*      Row(
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child: SizedBox(
                                                        height: AppSizes
                                                            .height_9,
                                                        child: Image.network(
                                                            serviceHistoryController
                                                                .getServiceHistoryResponse
                                                                .value
                                                                .data!
                                                                .equipment![
                                                            index]
                                                                .attchement
                                                                .toString())),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    AppSizes.width_4,
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
                                                                backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                                child: Image.network(serviceHistoryController
                                                                    .getServiceHistoryResponse
                                                                    .value
                                                                    .data!
                                                                    .equipment![
                                                                index]
                                                                    .attchement
                                                                    .toString()),
                                                              );
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
                                                            .size_11_5,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),*/
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
