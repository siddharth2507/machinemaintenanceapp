import 'package:flutter/material.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';

class DecorationUtilsPost {
  BuildContext context;

  DecorationUtilsPost(this.context);

  /// underline decoration
  InputDecoration getUnderlineInputDecoration({
    String? labelText = "",
    bool isRequire = false,
    bool isEnable = true,
    icon,
  }) {
    return InputDecoration(
      fillColor: dropDownColor,
      filled: true,
      contentPadding:
          const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 0),
      labelText: labelText,
      hintText: labelText,
      counterText: "",
      labelStyle: const TextStyle(
        color: Colors.grey,
      ),
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white38, width: 0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white38, width: 0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white38, width: 0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white38, width: 0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white38, width: 0),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
