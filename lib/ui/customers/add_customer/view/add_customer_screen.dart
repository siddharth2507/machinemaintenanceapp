import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:machinemaintainapp/ui/customers/add_customer/controller/add_customer_controller.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  AddCustomerController addCustomerController = Get.find();
  int? id = 0;
  String? companyName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: backgroundColor,
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
                    label: 'Add Customer',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ],
          )),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
            child: MyCommnonContainer(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    MyCommonFormField(
                      controller: addCustomerController.companyNameController,
                      hintText: 'Company name',
                      textCapitalization: TextCapitalization.characters,
                      textInputType: TextInputType.text,
                    ),
                    MyCommonFormField(
                      controller: addCustomerController.nameController,
                      hintText: 'Name',
                      textInputType: TextInputType.name,
                    ),
                    MyCommonFormField(
                      controller: addCustomerController.contactNumberController,
                      hintText: 'Contact Number',
                      textInputType: TextInputType.phone,
                    ),
                    MyCommonFormField(
                      controller:
                          addCustomerController.emailTextEditingController,
                      hintText: 'Contact Email',
                      textInputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MyThemeButton(
          height: AppSizes.height_6_6,
          buttonText: 'Submit',
          onPressed: () {
            if (addCustomerController.companyNameController.text.isEmpty) {
              CommanSnackbar.showError(
                  'Please Enter Company Name', 'Company Name is required');
            } else if (addCustomerController
                .nameController.value.text.isEmpty) {
              CommanSnackbar.showError('Please Enter Name', 'Name is required');
            } else if (addCustomerController
                .contactNumberController.text.isEmpty) {
              CommanSnackbar.showError(
                  'Please Enter Contact Number', 'Add Valid Contact Number');
            } else if (addCustomerController
                        .contactNumberController.value.text.length <
                    9 ||
                addCustomerController
                        .contactNumberController.value.text.length >
                    10) {
              CommanSnackbar.showError(
                  'Invalid Contact Number', 'Enter valid Contact number');
            } else if (addCustomerController
                .emailTextEditingController.value.text.isEmpty) {
              CommanSnackbar.showError(
                  'Please Enter Contact Email', 'Contact Email is required');
            } else {
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
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const MyRegularText(
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
                            ),
                            const MyRegularText(
                              label: 'Want to add Machine?',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            MyRegularText(
                              align: TextAlign.start,
                              label:
                                  "Hey, you want to add machine for this customer ? \nCustomer name: ${addCustomerController.nameController.value.text}",
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
                                          addCustomerController
                                              .addCustomer(context)
                                              .then((value) {
                                            Get.back();
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
                                        addCustomerController
                                            .addCustomer(context)
                                            .then((value) {
                                          id = addCustomerController
                                              .customerResponse.value.data?.id;
                                          companyName = addCustomerController
                                              .customerResponse
                                              .value
                                              .data
                                              ?.companyName;
                                          print('iddValue${id}');
                                          Get.toNamed(AppRoutes.addEquipment,
                                              arguments: [id, companyName]);
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

//Get.toNamed(AppRoutes.home);
