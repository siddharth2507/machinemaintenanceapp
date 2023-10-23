import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

/*double get AppDimensions.instance!.height => Get.context != null
    ? ResponsiveWrapper.of(Get.context!).screenHeight
    : Get.height;
double get AppDimensions.instance!.width => Get.context != null
    ? ResponsiveWrapper.of(Get.context!).screenWidth
    : Get.width;

Orientation get currentOrientation => Get.context != null
    ? ResponsiveWrapper.of(Get.context!).orientation
    : Get.mediaQuery.orientation;
bool get isLandscape {
  switch (currentOrientation) {
    case Orientation.portrait:
      return true;
    case Orientation.landscape:
      return false;
    default:
      return true;
  }
}*/

class AppDimensions extends ChangeNotifier {
// A singleton class to store the app dimensions
  static AppDimensions? _instance;
  static AppDimensions? get instance => _instance;

// The screen width, height and orientation and grid item count
  double width = 0;
  double height = 0;
  int gridItemCount = 1;
  Orientation? orientation;

// A private constructor that initializes the fields
  AppDimensions._internal(BuildContext context, BoxConstraints constraints) {
    orientation = MediaQuery.of(context).orientation;
    width = constraints.maxWidth;
    height = constraints.maxHeight;
    gridItemCount = _getCrossAxisCount(context);
    notifyListeners();
  }

// A factory method that creates or returns the singleton instance
  static AppDimensions createInstance(
      BuildContext context, BoxConstraints constraints) {
    AppDimensions.update(context, constraints);

    return _instance ??= AppDimensions._internal(context, constraints);
  }

  int _getCrossAxisCount(BuildContext context) {
    final screenWidth = context.width;
    if (screenWidth > 1000) {
      return 3; // 4 items per row for large screens
    } else if (screenWidth >= 800) {
      return 2; // 3 items per row for medium screens
    } else {
      return 2; // 2 items per row for small screens
    }
  }

  AppDimensions.updateGridCount(BuildContext context) {
    gridItemCount = _getCrossAxisCount(context);
    notifyListeners();
  }

  AppDimensions.update(BuildContext context, BoxConstraints constraints) {
    _instance = AppDimensions._internal(context, constraints);
    _updateDimensions(context, constraints);
    _updateOrientation(context);
    _getCrossAxisCount(context);
    _logDimensions();
  }

  void _updateDimensions(BuildContext context, BoxConstraints constraints) {
    /* if (orientation == Orientation.landscape) {
      width = constraints.maxHeight;
      height = constraints.maxWidth;
    } else {
      width = constraints.maxWidth;
      height = constraints.maxHeight;
    } */
    width = constraints.maxWidth;
    height = constraints.maxHeight;
    notifyListeners();
  }

  void _updateOrientation(BuildContext context) {
    orientation = MediaQuery.orientationOf(context);
  }

  void _logDimensions() {
    print("SCREEN WIDTH: $width");
    print("SCREEN HEIGHT: $height");
    print("ORIENTATION: $orientation");
    print("GRID: $gridItemCount");
  }
}