import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/common_components/component/my_common_formfield.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/components/widgets/my_theme_button.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/customers/edit_customer/controller/edit_customer_controller.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class EditCustomerScreen extends StatefulWidget {
  const EditCustomerScreen({super.key});

  @override
  State<EditCustomerScreen> createState() => _EditCustomerScreenState();
}

class _EditCustomerScreenState extends State<EditCustomerScreen> {
  EditCustomerController editCustomerController = Get.find();
  int id = 0;
  final digitsOnly = RegExp(r'^\d{0,10}$');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print('id----${Get.arguments[4]}');
      editCustomerController.companyNameController.text = Get.arguments[0];
      editCustomerController.nameController.text = Get.arguments[1];
      editCustomerController.contactNumberController.text = Get.arguments[2];
      editCustomerController.emailController.text = Get.arguments[3];
      id = Get.arguments[4];

      print('id is 2 -----${id}');
    });
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
                  label: 'Edit Customer',
                  color: Colors.white,
                  fontSize: 20,
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                          controller:
                              editCustomerController.companyNameController,
                          hintText: ' Company Name',
                          textCapitalization: TextCapitalization.characters,
                          textInputType: TextInputType.text,
                        ),
                        MyCommonFormField(
                          controller: editCustomerController.nameController,
                          hintText: 'Name',
                          textInputType: TextInputType.name,
                        ),
                        MyCommonFormField(
                          controller:
                              editCustomerController.contactNumberController,
                          hintText: 'Contact Number',
                          textInputType: TextInputType.phone,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.allow(
                          //       digitsOnly)
                          // ],
                        ),
                        MyCommonFormField(
                          controller: editCustomerController.emailController,
                          hintText: 'Contact Email',
                          textInputType: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.height_4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: MyThemeButton(
                  height: AppSizes.height_6_6,
                  buttonText: 'Edit Profile',
                  onPressed: () {
                    setState(() {
                      editCustomerController.editCustomer(context, id);
                    });
                    //Get.offAndToNamed(AppRoutes.login);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
