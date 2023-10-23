import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommanSnackbar{

  static showError(error,suggestion){
    return  Get.snackbar(error,suggestion,colorText: Colors.orange);
  }
  static showSuccess(success){
    return  Get.snackbar('', success,colorText: Colors.green);
  }

}