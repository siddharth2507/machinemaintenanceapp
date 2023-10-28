import 'package:flutter/material.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class HistoryContainer extends StatelessWidget {
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
  final String? type;
  final String? date;
  final String? service;
  final String? unitNo;
  final GestureTapCallback? onTap;
  final double? borderRadius;
  final Color? inkwellSplashColor;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const HistoryContainer({
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
    this.date,
    this.service,
    this.type,
    this.unitNo,
    this.onTap,
    this.borderRadius,
    this.inkwellSplashColor,
    this.borderRadiusGeometry,
    this.isRequire = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
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
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      label: machineName ?? '',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: child,
                    )
                  ],
                ),
                const Divider(
                  color: Color(0xFFFEF8F0),
                ),
                MyRegularText(
                  label: name ?? '',
                  fontSize: 20,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(
                  height: AppSizes.height_1,
                ),
                Row(
                  children: [
                    const MyRegularText(
                      label: "Unit no.",
                      color: primaryButtonColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    MyRegularText(
                      label: unitNo ?? '',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSizes.height_1,
                ),
                Row(
                  children: [
                    const MyRegularText(
                      label: "Last Service date [hour]:",
                      color: primaryButtonColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    MyRegularText(
                      label: date ?? '',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSizes.height_1,
                ),
                Row(
                  children: [
                    const MyRegularText(
                      label: 'Service type:',
                      color: primaryButtonColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    MyRegularText(
                        label: type ?? '',
                        /*color: Colors.grey,
                          fontWeight: FontWeight.bold,*/
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ],
                ),
                SizedBox(
                  height: AppSizes.height_1,
                ),
                Row(
                  children: [
                    const MyRegularText(
                      label: 'Last Engine service:',
                      color: primaryButtonColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    MyRegularText(
                        label: service ?? '',
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
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
