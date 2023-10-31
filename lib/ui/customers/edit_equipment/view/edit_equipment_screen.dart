
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/common_components/component/my_common_formfield.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/components/widgets/my_theme_button.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/customers/edit_equipment/controller/edit_equipment_controller.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class EditEquipmentScreen extends StatefulWidget {
  const EditEquipmentScreen({super.key});

  @override
  State<EditEquipmentScreen> createState() => _EditEquipmentScreenState();
}

class _EditEquipmentScreenState extends State<EditEquipmentScreen> {
  EditEquipmentController editEquipmentController = Get.find();
  String? machineName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editEquipmentController.machineNameController.text = Get.arguments[1];
    editEquipmentController.unitNumberController.text = Get.arguments[2];
    editEquipmentController.makeController.text = Get.arguments[3];
    editEquipmentController.modelNumberController.text = Get.arguments[4];
    editEquipmentController.manufactureController.text = Get.arguments[5];
    editEquipmentController.commissionController.text = Get.arguments[6];
    editEquipmentController.tenYearMajorController.text = Get.arguments[7];
    editEquipmentController.yearMajorController.text = Get.arguments[8];
    editEquipmentController.serialNumberController.text = Get.arguments[9];
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
                    label: 'Edit Equipment',
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
                  controller: editEquipmentController.machineNameController,
                  hintText: 'Add Machine Name',
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.characters,
                ),
                MyCommonFormField(
                  controller: editEquipmentController.unitNumberController,
                  hintText: 'Unit Number',
                  textInputType: TextInputType.name,
                ),
                MyCommonFormField(
                  controller: editEquipmentController.serialNumberController,
                  hintText: 'Serial Number',
                  textInputType: TextInputType.name,
                ),
                MyCommonFormField(
                  controller: editEquipmentController.modelNumberController,
                  hintText: 'Model Number',
                  textInputType: TextInputType.name,
                ),
                MyCommonFormField(
                  controller: editEquipmentController.makeController,
                  hintText: 'Make',
                  textInputType: TextInputType.name,
                ),
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
                          initialDate: DateTime(2023));
                      if (datePicked != null) {
                        setState(() {
                          editEquipmentController.manufactureController.text =
                              ('${datePicked.year}-${datePicked.month}-${datePicked.day}');
                        });
                      }
                    },
                    controller: editEquipmentController.manufactureController,
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
                          initialDate: DateTime(2023));
                      if (datePicked != null) {
                        setState(() {
                          editEquipmentController.commissionController.text =
                              ('${datePicked.year}-${datePicked.month}-${datePicked.day}');
                        });
                      }
                    },
                    controller: editEquipmentController.commissionController,
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
                          initialDate: DateTime(2023));
                      if (datePicked != null) {
                        setState(() {
                          editEquipmentController.tenYearMajorController.text =
                              ('${datePicked.year}-${datePicked.month}-${datePicked.day}');
                        });
                      }
                    },
                    controller: editEquipmentController.tenYearMajorController,
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
                          initialDate: DateTime(2023));
                      if (datePicked != null) {
                        setState(() {
                          editEquipmentController.yearMajorController.text =
                              ('${datePicked.year}-${datePicked.month}-${datePicked.day}');
                        });
                      }
                    },
                    controller: editEquipmentController.yearMajorController,
                    hintText: 'Date of 15 Year Major')
              ]),
            ),
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MyThemeButton(
          height: AppSizes.height_6_6,
          buttonText: 'Update',
          onPressed: () {
            editEquipmentController.editCustomerEquipment(
                context, Get.arguments[0]);
          },
        ),
      ),
    );
  }
}
