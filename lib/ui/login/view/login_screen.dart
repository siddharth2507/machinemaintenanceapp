import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/components/common_size/common_hight_width.dart';
import 'package:machinemaintainapp/components/common_size/nk_spacing.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/components/widgets/my_theme_button.dart';
import 'package:machinemaintainapp/ui/login/controller/login_controller.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

import '../../../components/widgets/my_comman_snackbar.dart';
import '../component/mylogintextfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.find();
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/icons/app_logo.png',
                  height: AppSizes.height_26,
                )),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyCommnonContainer(
                  borderRadiusGeometry: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  width: AppDimensions.instance!.width * 1,
                  child: Padding(
                    padding: nkRegularPadding(
                        top: AppSizes.height_2,
                        left: AppSizes.width_8,
                        right: AppSizes.width_8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MyRegularText(
                          label: 'Log In',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        SizedBox(height: AppSizes.height_2),
                        MyLoginTextField(
                          controller:
                              loginController.emailTextEditingController,
                          hintText: 'Email',
                          textInputType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          suffixIcon: const Icon(
                            Icons.done,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.height_3,
                        ),
                        MyLoginTextField(
                          controller:
                              loginController.passwordTextEditingController,
                          hintText: '******',
                          obscureText: true,
                          minLines: 1,
                        ),
                        SizedBox(
                          height: AppSizes.height_3,
                        ),
                        MyThemeButton(
                          height: AppSizes.height_6_5,
                          buttonText: 'Sign In',
                          onPressed: () {
                            if (loginController.emailTextEditingController.value
                                .text.isEmpty) {
                              CommanSnackbar.showError(
                                  'Please Enter Email Address',
                                  'Email Address is required');
                            } else if (loginController
                                .passwordTextEditingController
                                .value
                                .text
                                .isEmpty) {
                              CommanSnackbar.showError('Please Enter Password',
                                  'More Then 8 Characters  is required');
                            } else {
                              print('Sign In');
                              loginController.loginApi(context);
                            }
                          },
                        ),
                        SizedBox(
                          height: AppSizes.height_2,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
