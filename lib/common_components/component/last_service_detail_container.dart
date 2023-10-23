import 'package:flutter/material.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class ServiceDetailContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final bool isRequire;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Image? image;
  final Color? color;
  final String? date;
  final String? type;
  final String? service;
  final GestureTapCallback? onTap;
  final double? borderRadius;
  final Color? inkwellSplashColor;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const ServiceDetailContainer({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.image,
    this.color,
    this.onTap,
    this.borderRadius,
    this.inkwellSplashColor,
    this.borderRadiusGeometry,
    this.isRequire = false,
    required this.date,
    required this.type,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyCommnonContainer(
      child: MyCommnonContainer(
        color: Colors.orange.shade50,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyRegularText(
                    label: 'Last Service Details',
                    color: textColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  Padding(padding: EdgeInsets.zero,child: child,)
               //   SvgPicture.asset('assets/icons/file.svg'),
                ],
              ),
              // const MyRegularText(
              //   label: 'Last Service Details',
              //   color: textColor,
              //   fontSize: 10,
              //   fontWeight: FontWeight.w400,
              // ),
              const Divider(
                color: Colors.white70,
              ),
              Row(
                children: [
                  const MyRegularText(
                    label: "Last Service date [hour]:",
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  MyRegularText(
                    label: date ?? '',
                    fontSize: 10,
                    color: containerTextColor,
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
                      fontSize: 10,
                      color: containerTextColor,
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
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  MyRegularText(
                      label: service ?? '',
                      fontSize: 10,
                      color: containerTextColor,
                      fontWeight: FontWeight.w400
                      /*fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,*/
                      ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
