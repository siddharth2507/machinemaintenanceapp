import 'package:flutter/material.dart';
import 'package:machinemaintainapp/components/widgets/my_form_field.dart';

class MyLoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? minLines;
  final TextInputType textInputType;
  final TextCapitalization? textCapitalization;


  const MyLoginTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false, this.minLines,
    this.textInputType = TextInputType.text,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyFormField(
      controller: controller,
      labelText: '',
      obscureText: obscureText,
      maxLines: minLines,
      textInputType: textInputType,
      textCapitalization: textCapitalization ??
          TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(width: 1, color: Colors.grey.shade300)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade300,
            )),
      ),
    );
  }
}
