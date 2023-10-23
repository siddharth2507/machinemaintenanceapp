import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color/colors.dart';
import '../common_size/nk_general_size.dart';
import 'my_regular_text.dart';

class MyThemeButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? fontColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? letterSpacing;
  final Widget? child;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? padding;
  final bool? isRoundedCorner;

  const MyThemeButton({
    Key? key,
    @required this.buttonText,
    this.color = primaryButtonColor,
    this.onPressed,
    this.fontSize = 16.0,
    this.height,
    this.width,
    this.child,
    this.padding,
    this.letterSpacing,
    this.shape,
    this.isRoundedCorner = false,
    this.fontColor = buttonTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;
    return isRoundedCorner ?? true
        ? MaterialButton(
            height: height ?? 42,
            minWidth: width ?? Get.width,
            onPressed: onPressed,
            textTheme: theme.buttonTheme.textTheme,
            shape: shape ??
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        NkGeneralSize.nkCommonBorderRadius(borderRadius: 25))),
            padding: padding,
            color: color ?? theme.buttonTheme.colorScheme?.background,
            /* focusColor: color ??
                theme.buttonTheme.colorScheme?.background.withOpacity(0.7),*/
            disabledColor: color,
            child: Container(
              constraints:
                  BoxConstraints.loose(Size(width ?? Get.width, height ?? 32)),
              child: child ??
                  Center(
                    child: MyRegularText(
                      label: buttonText ?? "ADD NAME !!!!",
                      color: fontColor,
                      fontSize: fontSize,
                      letterSpacing: letterSpacing,
                    ),
                  ),
            ),
          )
        : MaterialButton(
            height: height ?? 42,
            minWidth: width ?? Get.width,
            onPressed: onPressed,
            shape: shape ??
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        NkGeneralSize.nkCommonBorderRadius())),
            padding: padding,
            color: color ?? theme.buttonTheme.colorScheme?.background,
            /* focusColor: color ??
                theme.buttonTheme.colorScheme?.background.withOpacity(0.7),*/
            disabledColor: color ?? theme.buttonTheme.colorScheme?.background,
            child: Container(
              constraints:
                  BoxConstraints.loose(Size(width ?? Get.width, height ?? 32)),
              child: child ??
                  Center(
                    child: MyRegularText(
                      label: buttonText ?? "ADD NAME !!!!",
                      color: fontColor,
                      fontSize: fontSize,
                      letterSpacing: letterSpacing,
                    ),
                  ),
            ),
          );
  }
}
