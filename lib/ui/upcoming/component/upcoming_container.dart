import 'package:flutter/material.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class UpComingContainer extends StatelessWidget {
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
  final String? unitNo;
  final String? nextService;
  final GestureTapCallback? onTap;
  final double? borderRadius;
  final Color? inkwellSplashColor;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const UpComingContainer({
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
    this.unitNo,
    this.nextService,
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
          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10,bottom: 10),
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
                  const MyRegularText(
                    label: "Unit no:",
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
              Padding(
                padding:  EdgeInsets.only(left: AppSizes.width_38),
                child: MyCommnonContainer(
                  width: AppSizes.width_42,
                  color: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        const MyRegularText(
                          label: "Next service:",
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        MyRegularText(
                          label: nextService ?? '',
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
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
