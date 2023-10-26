import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machinemaintainapp/components/common_size/common_hight_width.dart';
import 'package:machinemaintainapp/components/common_size/nk_spacing.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

import '../../theme/color/colors.dart';

class EquipmentServiceContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final bool isRequire;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Image? image;
  final Color? color;
  final String? machineName;
  final String? companyName;
  final String? make;
  final String? model;
  final String? serial;
  final String? manufactureDate;
  final String? commissionDate;
  final String? majorDate;
  final String? majorDatee;
  final GestureTapCallback? onTap;
  final double? borderRadius;
  final Color? inkwellSplashColor;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const EquipmentServiceContainer({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.image,
    this.color,
    required this.machineName,
    required this.companyName,
    required this.make,
    required this.model,
    required this.serial,
    this.manufactureDate,
    this.commissionDate,
    this.majorDate,
    this.majorDatee,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppDimensions.instance!.width * 1,
          color: containerColor,
          child: Padding(
            padding: nkRegularPadding(
                top: AppSizes.height_2,
                left: AppSizes.width_4,
                right: AppSizes.width_4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyRegularText(
                      label: companyName ?? '',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: child,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/box.svg',
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: AppSizes.width_2,
                      ),
                      MyRegularText(
                        label: machineName ?? '',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: dividerColour,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const MyRegularText(
                            label: 'Make',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 4, right: 4),
                          child: MyRegularText(
                              label: ':',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                        MyRegularText(
                            label: make ?? '',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 10)
                      ],
                    ),
                    Row(
                      children: [
                        const MyRegularText(
                          label: 'Model',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 4, right: 4),
                          child: MyRegularText(
                              label: ':',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                        MyRegularText(
                            label: model ?? '',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 10)
                      ],
                    ),
                    Row(
                      children: [
                        const MyRegularText(
                            label: 'Serial',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 4, right: 4),
                          child: MyRegularText(
                              label: ':',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                        MyRegularText(
                            label: serial ?? '',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 10)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSizes.height_2,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            const MyRegularText(
                              label: 'Manufacture date',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 7,
                            ),
                            MyRegularText(
                              label: manufactureDate ?? '',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: AppFontSize.size_9,
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: dividerColour,
                        indent: 6,
                        endIndent: 6,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            const MyRegularText(
                              label: 'Commission date ',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 7,
                            ),
                            MyRegularText(
                              label: commissionDate ?? '',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: AppFontSize.size_9,
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: dividerColour,
                        indent: 6,
                        endIndent: 6,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            const MyRegularText(
                              label: '10 Year Major date',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 6,
                            ),
                            MyRegularText(
                              label: majorDate ?? '',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: AppFontSize.size_9,
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: dividerColour,
                        indent: 6,
                        endIndent: 6,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            const MyRegularText(
                              label: '15 Year Major date',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 6,
                            ),
                            MyRegularText(
                                label: majorDatee ?? '',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: AppFontSize.size_9),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
