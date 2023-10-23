import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color/colors.dart';
import '../common_size/common_hight_width.dart';
import '../common_size/nk_font_size.dart';
import '../common_size/nk_general_size.dart';
import '../common_size/nk_spacing.dart';
import '../widgets/my_regular_text.dart';

class NkAppBar extends PreferredSize {
  final Widget? appBarChild;
  final Size? appBarSize;
  final String title;
  final Color? backgroundColor;
  final void Function()? onCloseTap;

  NkAppBar(
      {super.key,
      this.appBarChild,
      this.appBarSize,
      required this.title,
      this.backgroundColor,
      this.onCloseTap})
      : super(
            child: Container(),
            preferredSize: appBarSize ??
                Size.fromHeight(AppDimensions.instance!.height * 0.08));

  @override
  Widget get child => PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: nkRegularPadding(),
        decoration: BoxDecoration(color: backgroundColor ?? primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appBarChild ??
                MyRegularText(
                  label: title,
                  fontWeight: NkGeneralSize.nkBoldFontWeight(),
                  fontSize: NkFontSize.largeFont(),
                  color: buttonTextColor,
                ),
            InkResponse(
              onTap: onCloseTap ??
                  () {
                    Get.back();
                  },
              child: closeIcon,
            )
          ],
        ),
      ));

  Widget get closeIcon => Container(
        height: AppDimensions.instance!.height * 0.05,
        decoration: BoxDecoration(
          border: Border.all(color: buttonTextColor),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.close,
              size: AppDimensions.instance!.height * 0.02,
              color: buttonTextColor,
            ),
          ),
        ),
      );
}
