

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';

class Utils {
  static void hideSoftInputKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static bool ishintsave = false;
  static bool isloginsave = false;
  static bool setdatafirebasestatics = false;
  static String baseuriname = '';
  static String apitoken = '40|MQasuw19sFUA2MhpfBy625PK9yRCea3NSmcNmvRB';
  static int productindex = 0;
  static String language = "English";

  static String getDayOfWeek(DateTime date) => DateFormat('EEE').format(date);

  static String getDayOfMonth(DateTime date) => DateFormat('dd MMM').format(date);

  static String getDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);


  static Future<dio.MultipartFile> getFormData(String imagePath,
      {required String mapKeyName}) async {
    // get file name

    String fileNameMedia = '';
    if (imagePath.isNotEmpty) {
      File fileMedia = File(imagePath);
      fileNameMedia = basename(fileMedia.path);
      // String extensionMedia = fileNameMedia.split('.').last;
    }

    return await dio.MultipartFile.fromFile(
      imagePath,
      filename: fileNameMedia,
    );
  }



}
