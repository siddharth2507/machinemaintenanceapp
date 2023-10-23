import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class CustomerDetailContainer extends StatelessWidget {
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
  final String? date;
  final String? type;
  final String? service;
  final String? manufactureDate;
  final String? commissionDate;
  final String? majorDate;
  final String? majorDatee;
  final GestureTapCallback? onTap;
  final double? borderRadius;
  final Color? inkwellSplashColor;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const CustomerDetailContainer({
    Key? key,
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
    this.date,
    this.type,
    this.service,
    required this.manufactureDate,
    required this.commissionDate,
    required this.majorDate,
    required this.majorDatee,
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
                  child: child,
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
            MyCommnonContainer(
              onTap: onTap,
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
                        SvgPicture.asset('assets/icons/file.svg'),
                      ],
                    ),
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
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
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
                            fontSize: 10,
                            color: Colors.grey,
                            //color: containerTextColor,
                            fontWeight: FontWeight.w600),
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
                            color: Colors.grey,
                            fontWeight: FontWeight.w600
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
            SizedBox(
              height: AppSizes.height_1_5,
            ),
            MyCommnonContainer(
              color: Colors.orange.shade50,
              child: Padding(
                padding: const EdgeInsets.all(36),
                child: Column(
                  children: <Widget>[
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: [
                              MyRegularText(
                                  label: 'Manufacture date',
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppFontSize.size_8),
                              MyRegularText(
                                label: manufactureDate ?? '',
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: AppFontSize.size_12,
                              )
                            ],
                          ),
                          VerticalDivider(
                            color: Colors.orange.shade100,
                          ),
                          // Container(color: Colors.orange.shade100,width: 1,height: AppSizes.height_6,),
                          Column(
                            children: [
                              MyRegularText(
                                  label: 'Commission date',
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppFontSize.size_8),
                              MyRegularText(
                                  label: commissionDate ?? '',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppFontSize.size_12)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.orange.shade100,
                      indent: 4,
                      endIndent: 4,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: [
                              MyRegularText(
                                  label: '10 Year Major date',
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppFontSize.size_8),
                              MyRegularText(
                                  label: majorDate ?? '',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppFontSize.size_12)
                            ],
                          ),
                          //Container(color: Colors.orange.shade100,width: 1,height: AppSizes.height_6,),
                          VerticalDivider(
                            color: Colors.orange.shade100,
                          ),
                          Column(
                            children: [
                              MyRegularText(
                                label: '15 Year Major date',
                                fontWeight: FontWeight.w400,
                                fontSize: AppFontSize.size_8,
                              ),
                              MyRegularText(
                                label: majorDatee ?? '',
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: AppFontSize.size_12,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
