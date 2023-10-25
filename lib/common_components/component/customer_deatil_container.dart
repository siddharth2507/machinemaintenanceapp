import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class DetailContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final bool isRequire;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Image? image;
  final Color? color;
  final String? machineName;
  final String? name;
  final String? email;
  final String? number;
  final GestureTapCallback? onTap;
  final double? borderRadius;
  final Color? inkwellSplashColor;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const DetailContainer({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.image,
    this.color,
    required this.machineName,
    required this.name,
    this.number,
    this.email,
    this.onTap,
    this.borderRadius,
    this.inkwellSplashColor,
    this.borderRadiusGeometry,
    this.isRequire = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: AppSizes.height_2,
        //   width: AppSizes.width_6,
        // ),
        MyCommnonContainer(
          color: color,
          borderRadiusGeometry: borderRadiusGeometry,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyRegularText(
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isRequire ? Colors.white : Colors.black),
                      label: machineName?.toUpperCase() ?? '',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: child,
                    )
                  ],
                ),
                Divider(
                  color: Colors.orange.shade400,
                ),
                MyRegularText(
                  label: name ?? '',
                  fontSize: 20,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: isRequire ? Colors.white : Colors.black),
                ),
                SizedBox(
                  height: AppSizes.height_1,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/call_incoming.svg'),
                    SizedBox(width: AppSizes.width_1_5),
                    MyRegularText(
                      label: "+61-${number ?? ''}",
                      fontSize: 16,
                      style: TextStyle(
                          fontSize: 12,
                          color: isRequire ? Colors.white : Colors.grey),
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSizes.height_0_3,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/sms_notification.svg'),
                    SizedBox(
                      width: AppSizes.width_1_5,
                    ),
                    MyRegularText(
                      label: email ?? '',
                      fontSize: 16,
                      style: TextStyle(
                          fontSize: 12,
                          color: isRequire ? Colors.white : Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
