import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/common_components/component/my_common_formfield.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/components/widgets/my_theme_button.dart';
import 'package:machinemaintainapp/routes/routes.dart';
import 'package:machinemaintainapp/session/session_helper.dart';
import 'package:machinemaintainapp/session/session_manager.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/ui/login/model/login_response.dart';
import 'package:machinemaintainapp/ui/logout/controller/logout_controller.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

import '../../../components/widgets/my_comman_snackbar.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({super.key});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  LogOutController logOutController = Get.find();
  User? user;
  LoginResponse? loginResponse;
  String? Name = '';
  String? Email = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SessionHelper().getLoginResponse().then((value) {
      print('Dataa>>>>>>${value!.data!.user?.email.toString()} ');
      setState(() {
        loginResponse=value;
        logOutController.nameController.text=value.data!.user!.name.toString();
        logOutController.emailController.text=value.data!.user!.email.toString();

      });
    });
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
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      )),
                  const MyRegularText(
                    label: 'Profile',
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
                        controller: logOutController.nameController,
                        hintText: 'Name',
                        isReadOnly: true,
                        textInputType: TextInputType.text,
                      ),
                      MyCommonFormField(
                        controller: logOutController.emailController,
                        hintText:'Email',
                        isReadOnly: true,
                        textInputType: TextInputType.name,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSizes.height_4,),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: MyThemeButton(
                height: AppSizes.height_6_6,
                buttonText: 'Logout',
                onPressed: () {
                  if (logOutController.nameController.text.isEmpty) {
                    CommanSnackbar.showError(
                        'Please Enter  Name', 'Name is required');
                  } else
                  if (logOutController.nameController.text.isEmpty) {
                    CommanSnackbar.showError(
                        'Please Enter Email', 'Email is required');
                  } else {
                    SessionManager.clearData();
                    Get.offAndToNamed(AppRoutes.login);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}