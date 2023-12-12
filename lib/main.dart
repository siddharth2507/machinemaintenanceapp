import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinemaintainapp/components/common_size/common_hight_width.dart';
import 'package:machinemaintainapp/routes/routes.dart';
import 'package:machinemaintainapp/theme/get_theme.dart';
import 'package:sizer/sizer.dart';

import 'general_binding/common_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// [backgroundHandler] use to handle notification on background
  runApp(const GetMyApp());
}

class GetMyApp extends StatelessWidget {
  const GetMyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      AppDimensions.createInstance(context, SizerUtil.boxConstraints);
      return GetMaterialApp(
        theme: NkGetXTheme.lightTheme,
        darkTheme: NkGetXTheme.lightTheme,
        getPages: AppRoutes.generatedRoutes,
        initialRoute: AppRoutes.splash,
        themeMode: ThemeMode.system,
        initialBinding: CommonBinding(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
