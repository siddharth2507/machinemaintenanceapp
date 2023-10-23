import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machinemaintainapp/components/widgets/my_form_field.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class MyCommonFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final GestureTapCallback? onTap;
  final int? minLines;
  final bool isReadOnly;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;


  const MyCommonFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.minLines,
    this.textInputType = TextInputType
        .text, this.onTap, this.prefixIcon, this.isReadOnly = false, this.inputFormatters, this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        MyFormField(
          textCapitalization: textCapitalization ??
              TextCapitalization.sentences,
          isReadOnly: isReadOnly,
          borderRadius: BorderRadius.circular(24),
          textInputType: textInputType,
          controller: controller,
          labelText: 'hintText',
          obscureText: obscureText,
          maxLines: minLines,
          onTap: onTap,
          inputFormatters: inputFormatters,

          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: Colors.orange.shade50),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: Colors.orange.shade50),
                borderRadius: BorderRadius.circular(8),
              ),
              border: InputBorder.none,
              label: MyRegularText(
                label: hintText,
              ),
              // hintText: hintText,
              suffixIcon: suffixIcon,

              prefixIcon: prefixIcon,
              fillColor: backgroundColor,
              filled: true),
        ),
        SizedBox(
          height: AppSizes.height_2,
        )
      ],
    );
  }
}
