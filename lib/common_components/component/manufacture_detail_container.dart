import 'package:flutter/material.dart';
import 'package:machinemaintainapp/components/widgets/my_common_container.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class ManufactureDetailContainer extends StatelessWidget {
final Widget? child;
final double? width;
final bool isRequire;
final double? height;
final EdgeInsets? padding;
final EdgeInsets? margin;
final Image? image;
final Color? color;
final String? manufactureDate;
final String? commissionDate;
final String? majorDate;
final String? majorDatee;
final GestureTapCallback? onTap;
final double? borderRadius;
final Color? inkwellSplashColor;
final BorderRadiusGeometry? borderRadiusGeometry;

const ManufactureDetailContainer({
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
required this.manufactureDate,
required this.commissionDate,
required this.majorDate,
required this.majorDatee,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyCommnonContainer(
      child:  MyCommnonContainer(
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
      ),
    );
  }
}