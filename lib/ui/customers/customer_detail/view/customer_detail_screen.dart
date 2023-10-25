import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/common_components/component/common_list_view.dart';
import 'package:machinemaintainapp/common_components/component/customer_deatil_container.dart';
import 'package:machinemaintainapp/common_components/component/last_service_detail_container.dart';
import 'package:machinemaintainapp/common_components/component/machine_container.dart';
import 'package:machinemaintainapp/common_components/component/manufacture_detail_container.dart';
import 'package:machinemaintainapp/common_components/component/my_button.dart';
import 'package:machinemaintainapp/components/common_size/common_hight_width.dart';
import 'package:machinemaintainapp/components/common_size/nk_spacing.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/components/widgets/my_theme_button.dart';
import 'package:machinemaintainapp/routes/routes.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/customers/customer_detail/contoller/customer_detail_controller.dart';
import 'package:machinemaintainapp/utills/const_string.dart';
import 'package:machinemaintainapp/utills/session/nk_dates_utils.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class CustomerDetailScreen extends StatefulWidget {
  const CustomerDetailScreen({super.key});

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  CustomerDetailController customerDetailController = Get.find();
  String? machineName = '';
  String? name = '';
  String? email = '';
  String? number = '';
  int id = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = Get.arguments;
    setState(() {
      machineName = data[0];
      name = data[1];
      email = data[3];
      number = data[2];
      id = data[4] ?? 0;
      customerDetailController.customerEquipment(context, id);
      print('id is 1 -----${id}');
    });
    // super.initState();
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
                    label: 'Customer Detail',
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
              DetailContainer(
                borderRadiusGeometry: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
                color: containerColor,
                isRequire: true,
                machineName: machineName ?? '',
                name: name ?? '',
                number: number ?? '',
                email: email ?? '',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.editCustomer, arguments: [
                            machineName ?? '',
                            name ?? '',
                            number ?? '',
                            email ?? '',
                            id
                          ]);
                        },
                        child: SvgPicture.asset('assets/icons/edit.svg')),
                    SizedBox(
                      width: AppSizes.width_3,
                    ),
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return MyCommnonContainer(
                                  width: AppDimensions.instance!.width * 1,
                                  child: Padding(
                                    padding: nkRegularPadding(
                                      top:
                                      AppDimensions.instance!.height * 0.02,
                                      bottom:
                                      AppDimensions.instance!.height * 0.02,
                                      left:
                                      AppDimensions.instance!.width * 0.04,
                                      right:
                                      AppDimensions.instance!.width * 0.04,
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const MyRegularText(
                                            label:
                                            'Are you want to Sure Delete??',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          SizedBox(
                                            height: AppSizes.height_2,
                                          ),
                                          const MyRegularText(
                                            align: TextAlign.start,
                                            label: customer,
                                            color: Colors.grey,
                                            maxlines: 4,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          SizedBox(
                                            height: AppSizes.height_3,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 8.0),
                                                  child: MyThemeButton(
                                                      height:
                                                      AppSizes.height_6_6,
                                                      color:
                                                      Colors.grey.shade200,
                                                      buttonText: 'Cancel',
                                                      fontColor: Colors.black,
                                                      onPressed: () {
                                                        Get.back();
                                                      }),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 8.0),
                                                  child: MyThemeButton(
                                                      height:
                                                      AppSizes.height_6_6,
                                                      buttonText: 'Delete',
                                                      color: Colors.red,
                                                      onPressed: () {
                                                        customerDetailController
                                                            .deleteCustomer(
                                                            context, id);
                                                      }),
                                                ),
                                              )
                                            ],
                                          )
                                        ]),
                                  ),
                                );
                              });
                        },
                        child: SvgPicture.asset('assets/icons/delete.svg'))
                  ],
                ),
              ),
              Obx(
                    () =>
                customerDetailController
                    .equipmentResponse.value.data?.equipment?.length !=
                    0
                    ? CommonList(
                  length: customerDetailController.equipmentResponse.value
                      .data?.equipment?.length ??
                      0,
                  physics: const NeverScrollableScrollPhysics(),
                  child: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(
                          top: AppSizes.height_2,
                          right: AppSizes.width_4,
                          left: AppSizes.width_4,
                        ),
                        child: CustomerMachineContainer(
                          make: customerDetailController.equipmentResponse
                              .value.data!.equipment![index].make,
                          model: customerDetailController
                              .equipmentResponse
                              .value
                              .data!
                              .equipment![index]
                              .model,
                          serial: customerDetailController
                              .equipmentResponse
                              .value
                              .data!
                              .equipment![index]
                              .serialNumber,
                          companyName: customerDetailController
                              .equipmentResponse
                              .value
                              .data!
                              .equipment![index]
                              .machineName,
                          unitNo: customerDetailController
                              .equipmentResponse
                              .value
                              .data!
                              .equipment![index]
                              .unitNumber,
                          childd: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.equipmentService,
                                      arguments: [
                                        id,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .id,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .machineName,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .make,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .model,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .serialNumber,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOfManufactur,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOfCommission,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOf10YearMajor,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOf15YearMajor,
                                        machineName,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .lastUpcommingServiceDetails!
                                            .isEmpty
                                            ? 0
                                            : customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .lastUpcommingServiceDetails![
                                        0]
                                            .id,
                                      ])?.then((value) {
                                    customerDetailController
                                        .customerEquipment(context, id);
                                  });
                                  // ?.then((value) { customerDetailController.customerEquipment(context, id);});
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.orange,
                                  size: 22,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.editEquipment,
                                      arguments: [
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .id,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .machineName,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .unitNumber,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .make,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .model,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOfManufactur
                                            .toString(),
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOfCommission
                                            .toString(),
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOf10YearMajor
                                            .toString(),
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOf15YearMajor
                                            .toString(),
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .serialNumber
                                            .toString(),
                                        /* customerDetailController
                                                  .equipmentResponse
                                                  .value
                                                  .data!
                                                  .equipment![index]*/
                                      ]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6, right: 6),
                                  child: SvgPicture.asset(
                                    'assets/icons/edit.svg',
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return MyCommnonContainer(
                                          width: AppDimensions
                                              .instance!.width *
                                              1,
                                          child: Padding(
                                            padding: nkRegularPadding(
                                              top: AppDimensions
                                                  .instance!.height *
                                                  0.02,
                                              bottom: AppDimensions
                                                  .instance!.height *
                                                  0.02,
                                              left: AppDimensions
                                                  .instance!.width *
                                                  0.04,
                                              right: AppDimensions
                                                  .instance!.width *
                                                  0.04,
                                            ),
                                            child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                children: <Widget>[
                                                  const MyRegularText(
                                                    label:
                                                    'Are you want to Sure Delete??',
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    AppSizes.height_2,
                                                  ),
                                                  const MyRegularText(
                                                    align:
                                                    TextAlign.start,
                                                    label: customer,
                                                    color: Colors.grey,
                                                    maxlines: 4,
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    AppSizes.height_3,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              right:
                                                              8.0),
                                                          child:
                                                          MyThemeButton(
                                                              height: AppSizes
                                                                  .height_6_6,
                                                              color: Colors
                                                                  .grey
                                                                  .shade200,
                                                              buttonText:
                                                              'Cancel',
                                                              fontColor:
                                                              Colors
                                                                  .black,
                                                              onPressed:
                                                                  () {
                                                                Get.back();
                                                              }),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              left:
                                                              8.0),
                                                          child:
                                                          MyThemeButton(
                                                              height: AppSizes
                                                                  .height_6_6,
                                                              buttonText:
                                                              'Delete',
                                                              color: Colors
                                                                  .red,
                                                              onPressed:
                                                                  () {
                                                                customerDetailController
                                                                    .deleteCustomerEquipment(
                                                                    context,
                                                                    customerDetailController
                                                                        .equipmentResponse
                                                                        .value
                                                                        .data!
                                                                        .equipment![index]
                                                                        .id!
                                                                        .toInt());
                                                              }),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ]),
                                          ),
                                        );
                                      });
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/delete.svg',
                                  color: Colors.orange,
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.serviceNote,
                                      arguments: [
                                        id,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .id,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .machineName,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .make,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .model,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .serialNumber,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOfManufactur,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOfCommission,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOf10YearMajor,
                                        customerDetailController
                                            .equipmentResponse
                                            .value
                                            .data!
                                            .equipment![index]
                                            .dateOf15YearMajor,
                                        machineName,
                                      ]);
                                },
                                child: ServiceDetailContainer(
                                  date: (customerDetailController
                                      .equipmentResponse
                                      .value
                                      .data!
                                      .equipment![index]
                                      .lastCompletedServiceDetails!
                                      .isNotEmpty)
                                      ? NKDateUtils.commonDayFormat(
                                      NKDateUtils.formatStringUTCDateTime(
                                          customerDetailController
                                              .equipmentResponse
                                              .value
                                              .data!
                                              .equipment![index]
                                              .lastCompletedServiceDetails!
                                              .last
                                              .lastServiceDate!
                                              .toString()))
                                      : "No Data Found ",
                                  type: (customerDetailController
                                      .equipmentResponse
                                      .value
                                      .data!
                                      .equipment![index]
                                      .lastCompletedServiceDetails!
                                      .isNotEmpty)
                                      ? customerDetailController
                                      .equipmentResponse
                                      .value
                                      .data!
                                      .equipment![index]
                                      .lastCompletedServiceDetails![0]
                                      .serviceType
                                      : "No Data Found",
                                  service: (customerDetailController
                                      .equipmentResponse
                                      .value
                                      .data!
                                      .equipment![index]
                                      .lastCompletedServiceDetails!
                                      .isNotEmpty)
                                      ? customerDetailController
                                      .equipmentResponse
                                      .value
                                      .data!
                                      .equipment![index]
                                      .lastCompletedServiceDetails![0]
                                      .lastServiceReading
                                      : "No Data Found",
                                  child: SvgPicture.asset(
                                      'assets/icons/file.svg'),
                                ),
                              ),
                              SizedBox(
                                height: AppSizes.height_1_5,
                              ),
                              ManufactureDetailContainer(
                                  manufactureDate:customerDetailController
                                      .equipmentResponse
                                      .value
                                      .data!
                                      .equipment![index]
                                      .dateOfManufactur != null ?
                                  NKDateUtils.commonDayFormat(
                                      NKDateUtils
                                          .formatStringUTCDateTime(
                                          customerDetailController
                                              .equipmentResponse
                                              .value
                                              .data!
                                              .equipment![index]
                                              .dateOfManufactur!
                                              .toString())):'',
                                  // commissionDate:NKDateUtils.commonDayFormat(
                                  // NKDateUtils.formatStringUTCDateTime(
                                  commissionDate: customerDetailController
                                      .equipmentResponse
                                      .value
                                      .data!
                                      .equipment![index]
                                      .dateOfCommission != null ?
                                  NKDateUtils.commonDayFormat(
                                      NKDateUtils
                                          .formatStringUTCDateTime(
                                          customerDetailController
                                              .equipmentResponse
                                              .value
                                              .data!
                                              .equipment![index]
                                              .dateOfCommission!
                                              .toString())) :
                                  "",
                                  majorDate: customerDetailController
                                      .equipmentResponse
                                      .value
                                      .data!
                                      .equipment![index]
                                      .dateOf10YearMajor != null ? NKDateUtils
                                      .commonDayFormat(
                                      NKDateUtils
                                          .formatStringUTCDateTime(
                                          customerDetailController
                                              .equipmentResponse
                                              .value
                                              .data!
                                              .equipment![index]
                                              .dateOf10YearMajor!
                                              .toString())) :
                                  "",
                                  majorDatee: customerDetailController
                                      .equipmentResponse
                                      .value
                                      .data!
                                      .equipment![index]
                                      .dateOf15YearMajor != null ? NKDateUtils
                                      .commonDayFormat(
                                      NKDateUtils
                                          .formatStringUTCDateTime(
                                          customerDetailController
                                              .equipmentResponse
                                              .value
                                              .data!
                                              .equipment![index]
                                              .dateOf15YearMajor!
                                              .toString())) : ''
                              )
                            ],
                          ),
                        ));
                  },
                )
                    : Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: AppSizes.height_40),
                    child: const MyRegularText(
                      label: 'No Customer Equipment Available',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: MyButton(
        text: 'Add',
        child: 'assets/icons/box.svg',
        onPressed: () {
          Get.toNamed(AppRoutes.addEquipment, arguments: [id, machineName])
              ?.then((value) {
            customerDetailController.customerEquipment(context, id);
          });
        },
      ),
    );
  }
}
