import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/utills/progressbar.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';
import '../../routes/routes.dart';
import '../../session/session_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = const Duration(seconds: 3);
    Timer(_duration, getNavigationPage);
  }

  getNavigationPage() {
  // Get.toNamed(AppRoutes.login);
   SessionHelper().getIntro().then((value) {
     if (value != null) {
       if (value==1) {
        // ProgressBar.showProgressBarApi(context);
         Get.offAllNamed(AppRoutes.bottomTab);
       }else{
         Get.offAllNamed(AppRoutes.login);
       }
     } else {
       Get.offAllNamed(AppRoutes.login);
     }
   });
  }

  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: AppSizes.width_4_5,right: AppSizes.width_4_5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(alignment:Alignment.center,
          child: Image.asset('assets/icons/app_logo.png')),
            ],
          ),
        ),
      ),
    );
  }
}


