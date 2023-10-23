import 'package:flutter/material.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/theme/color/colors.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class MachineDateDetailContainer extends StatelessWidget {
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

  const MachineDateDetailContainer({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.image,
    this.color,
    required this.manufactureDate,
    required this.commissionDate,
    required this.majorDate,
    required this.majorDatee,
    this.onTap,
    this.borderRadius,
    this.inkwellSplashColor,
    this.borderRadiusGeometry,
    this.isRequire = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  const MyRegularText(label: 'Manufacture date',fontWeight: FontWeight.w400,color: Colors.white,fontSize: 7,),
                  MyRegularText(label:manufactureDate??'' ,fontWeight: FontWeight.w500,color: Colors.white,fontSize: AppFontSize.size_9,),
                ],
              ),
            ),
            const VerticalDivider(color: dividerColour,indent: 6,endIndent: 6,),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  const MyRegularText(label: 'Commission date ',fontWeight: FontWeight.w400,color: Colors.white,fontSize: 7,),
                  MyRegularText(label:commissionDate??'' ,fontWeight: FontWeight.w500,color: Colors.white,fontSize: AppFontSize.size_9,),
                ],
              ),
            ),
            const VerticalDivider(color: dividerColour,indent: 6,endIndent: 6,),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  const MyRegularText(label: '10 Year Major date',fontWeight: FontWeight.w400,color: Colors.white,fontSize: 6,),
                  MyRegularText(label:majorDate??'' ,fontWeight: FontWeight.w500,color: Colors.white,fontSize: AppFontSize.size_9,),
                ],
              ),
            ),
            const VerticalDivider(color: dividerColour,indent: 6,endIndent: 6,),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  const MyRegularText(label: '15 Year Major date',fontWeight: FontWeight.w400,color: Colors.white,fontSize: 6,),
                  MyRegularText(label:majorDatee??'' ,fontWeight: FontWeight.w500,color: Colors.white,fontSize:AppFontSize.size_9),
                ],
              ),
            ),
          ],
        ),
      ),
   );
  }
}