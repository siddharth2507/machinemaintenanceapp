import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machinemaintainapp/components/common_size/common_hight_width.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';
import 'package:machinemaintainapp/components/widgets/my_theme_button.dart';
import 'package:machinemaintainapp/utills/sizer_utils.dart';

class MyButton extends StatelessWidget {

  final String? child;
  final String? text;
  final EdgeInsets? padding;
  final VoidCallback? onPressed;

  const MyButton({Key? key, this.text, this.padding, this.onPressed, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: AppDimensions.instance!.width * 0.28,
      //height: AppDimensions.instance!.height * 0.06,
      child: MyThemeButton(
        onPressed: onPressed,
        buttonText: '',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(child??'',color: Colors.white,width: 20,height: 20,),
            SizedBox(width: AppSizes.width_1_5,),
            MyRegularText(
              label: text ?? '',
              color: Colors.white,
              fontSize: 18,
            ),

          ],
        ),
      ),
    );
  }
}
