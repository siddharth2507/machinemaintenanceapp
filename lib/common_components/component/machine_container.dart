import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class CustomerMachineContainer extends StatelessWidget {
  final Widget? childd;
  final Widget? child;
  final double? width;
  final bool isRequire;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Image? image;
  final Color? color;
  final String? make;
  final String? companyName;
  final String? unitNo;
  final String? model;
  final String? serial;
  final GestureTapCallback? onTap;
  final double? borderRadius;
  final Color? inkwellSplashColor;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const CustomerMachineContainer({
    Key? key,
    this.childd,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.image,
    this.color,
    required this.make,
    required this.model,
    required this.serial,
    this.onTap,
    this.borderRadius,
    this.inkwellSplashColor,
    this.borderRadiusGeometry,
    this.isRequire = false,
    required this.companyName,
    required this.unitNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyCommnonContainer(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/box.svg',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    MyRegularText(
                      label: companyName ?? '',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: childd,
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.height_0_3,
            ),
            Row(
              children: [
                const MyRegularText(
                  label: 'Unit no: ',
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                const SizedBox(
                  width: 2,
                ),
                MyRegularText(
                  label: unitNo ?? '',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.height_1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const MyRegularText(
                      label: 'Make:',
                      color: Colors.orange,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    MyRegularText(
                      label: make ?? '',
                      color: containerTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const MyRegularText(
                      label: 'Model:',
                      color: Colors.orange,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    MyRegularText(
                      label: model ?? '',
                      color: containerTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const MyRegularText(
                      label: 'Serial:',
                      color: Colors.orange,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    MyRegularText(
                      label: serial ?? '',
                      color: containerTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.height_1_5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: child,
            ),

          ],
        ),
      ),
    );
  }
}
