import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/common_components/component/my_common_formfield.dart';
import 'package:machinemaintainapp/components/common_size/common_hight_width.dart';
import 'package:machinemaintainapp/components/common_size/nk_spacing.dart';
import 'package:machinemaintainapp/components/widgets/common_snackbar.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/components/widgets/my_theme_button.dart';
import 'package:machinemaintainapp/routes/routes.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/customers/add_equipment/controller/add_equipment_controller.dart';
import 'package:machinemaintainapp/utills/const_string.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class AddEquipmentScreen extends StatefulWidget {
  const AddEquipmentScreen({super.key});

  @override
  State<AddEquipmentScreen> createState() => _AddEquipmentScreenState();
}

class _AddEquipmentScreenState extends State<AddEquipmentScreen> {
  AddEquipmentController addEquipmentController = Get.find();
  String? companyName = '';
  int id = 0;
  int equipmentId = 0;

  @override
  void initState() {
    // TODO: implement initState
    var data = Get.arguments;
    id = data[0];
    companyName = data[1];
    print("customer_id${id}");
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
                    label: 'Add New Equipment',
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
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
            child: MyCommnonContainer(
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                child: Column(children: [
                  MyCommonFormField(
                    controller: addEquipmentController.machineNameController,
                    hintText: 'Add Machine Name',
                    textInputType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                  ),
                  MyCommonFormField(
                    controller: addEquipmentController.unitNumberController,
                    hintText: 'Unit Number',
                    textInputType: TextInputType.name,
                    textCapitalization: TextCapitalization.characters,
                  ),
                  MyCommonFormField(
                    controller: addEquipmentController.mAkeController,
                    hintText: 'Make',
                    textInputType: TextInputType.name,
                    textCapitalization: TextCapitalization.characters,
                  ),
                  MyCommonFormField(
                    controller: addEquipmentController.serialNumberController,
                    hintText: 'Serial Number',
                    textInputType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                  ),
                  MyCommonFormField(
                    controller: addEquipmentController.modelNumberController,
                    hintText: 'Model Number',
                    textInputType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                  ),
                  MyCommonFormField(
                      isReadOnly: true,
                      suffixIcon: Image.asset(
                        'assets/icons/calendar.png',
                        width: 8,
                        height: 8,
                      ),
                      onTap: () async {
                        DateTime? datePicked = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2002),
                            lastDate: DateTime.now(),
                            initialDate: DateTime.now());
                        if (datePicked != null) {
                          setState(() {
                            addEquipmentController.manufactureController.text =
                                ('${datePicked.year}/${datePicked.month}/${datePicked.day}');
                          });
                        }
                      },
                      controller: addEquipmentController.manufactureController,
                      hintText: 'Date of manufacture'),
                  MyCommonFormField(
                      isReadOnly: true,
                      suffixIcon: Image.asset(
                        'assets/icons/calendar.png',
                      ),
                      onTap: () async {
                        DateTime? datePicked = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2002),
                            lastDate: DateTime(2024),
                            initialDate: DateTime.now());
                        if (datePicked != null) {
                          setState(() {
                            addEquipmentController.commissionController.text =
                                ('${datePicked.year}/${datePicked.month}/${datePicked.day}');
                          });
                        }
                      },
                      controller: addEquipmentController.commissionController,
                      hintText: 'Date of Commission'),
                  MyCommonFormField(
                      isReadOnly: true,
                      suffixIcon: Image.asset(
                        'assets/icons/calendar.png',
                      ),
                      onTap: () async {
                        DateTime? datePicked = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2002),
                            lastDate: DateTime(2024),
                            initialDate: DateTime.now());
                        if (datePicked != null) {
                          setState(() {
                            addEquipmentController.tenYearMajorController.text =
                                ('${datePicked.year}/${datePicked.month}/${datePicked.day}');
                          });
                        }
                      },
                      controller: addEquipmentController.tenYearMajorController,
                      hintText: 'Date of 10 Year Major'),
                  MyCommonFormField(
                      isReadOnly: true,
                      suffixIcon: Image.asset(
                        'assets/icons/calendar.png',
                      ),
                      onTap: () async {
                        DateTime? datePicked = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2002),
                            lastDate: DateTime(2024),
                            initialDate: DateTime.now());
                        if (datePicked != null) {
                          setState(() {
                            addEquipmentController.yearMajorController.text =
                                ('${datePicked.year}/${datePicked.month}/${datePicked.day}');
                          });
                        }
                      },
                      controller: addEquipmentController.yearMajorController,
                      hintText: 'Date of 15 Year Major')
                ]),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MyThemeButton(
          height: AppSizes.height_6_6,
          buttonText: 'Next',
          onPressed: () {
            if (addEquipmentController.machineNameController.text.isEmpty) {
              CommanSnackbar.showError(
                  'Please Enter Machine Name', 'Machine Name is required');
            } else if (addEquipmentController
                .unitNumberController.value.text.isEmpty) {
              CommanSnackbar.showError(
                  'Please Enter Unit Number', 'Unit Number is required');
            } else if (addEquipmentController
                .serialNumberController.value.text.isEmpty) {
              CommanSnackbar.showError(
                  'Please Enter Serial Number', 'Serial Number is required');
            } else if (addEquipmentController
                .modelNumberController.value.text.isEmpty) {
              CommanSnackbar.showError(
                  'Please Enter Model Number', 'Model Number is required');
            }  else {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return MyCommnonContainer(
                      width: AppDimensions.instance!.width * 1,
                      child: Padding(
                        padding: nkRegularPadding(
                          top: AppDimensions.instance!.height * 0.02,
                          bottom: AppDimensions.instance!.height * 0.02,
                          left: AppDimensions.instance!.width * 0.04,
                          right: AppDimensions.instance!.width * 0.04,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Align(
                              alignment: Alignment.topRight,
                              child: MyRegularText(
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.grey,
                                  decorationColor: Colors.grey,
                                  fontSize: 16,
                                ),
                                align: TextAlign.right,
                                label: 'Close',
                              ),
                            ),
                            const MyRegularText(
                              label: 'Want to add Service?',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const MyRegularText(
                              align: TextAlign.start,
                              label: customer,
                              color: Colors.grey,
                              maxlines: 4,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: MyThemeButton(
                                        height: AppSizes.height_6_6,
                                        color: Colors.grey.shade200,
                                        buttonText: 'Not Now',
                                        fontColor: Colors.black,
                                        onPressed: () {
                                          addEquipmentController
                                              .addCustomerEquipment(context, id)
                                              .then((value) {
                                                addEquipmentController.saveServiceHistoryFirstTime(context, id, value!.data!.id!).then((value) {Get.close(1);});
                                          });
                                        }),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: MyThemeButton(
                                      height: AppSizes.height_6_6,
                                      buttonText: 'Yes, Please',
                                      onPressed: () {
                                        addEquipmentController
                                            .addCustomerEquipment(context, id)
                                            .then((value) {
                                          equipmentId = addEquipmentController
                                              .addEquipmentResponse
                                              .value
                                              .data!
                                              .id!;

                                          addEquipmentController.saveServiceHistoryFirstTime(context, id, equipmentId).then((value) {
                                            Get.toNamed(
                                                AppRoutes.equipmentService,
                                                arguments: [
                                                  id,
                                                  equipmentId,
                                                  addEquipmentController
                                                      .machineNameController.text,
                                                  addEquipmentController
                                                      .mAkeController.text,
                                                  addEquipmentController
                                                      .modelNumberController.text,
                                                  addEquipmentController
                                                      .serialNumberController
                                                      .text,
                                                  addEquipmentController
                                                      .manufactureController.text,
                                                  addEquipmentController
                                                      .commissionController.text,
                                                  addEquipmentController
                                                      .tenYearMajorController
                                                      .text,
                                                  addEquipmentController
                                                      .yearMajorController.text,
                                                  companyName,value.data?.id
                                                ]);
                                          });
                                          print(
                                              'equipmentIddd>>>${equipmentId}');

                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
