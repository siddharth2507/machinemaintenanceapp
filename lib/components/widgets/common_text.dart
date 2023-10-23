import 'package:flutter/material.dart';
import 'package:machinemaintainapp/components/widgets/my_regular_text.dart';

class MyIconText extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final EdgeInsets? padding;
  final double? fontSize;

  const MyIconText({Key? key, this.icon, this.text, this.padding, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Icon(
          icon ?? Icons.favorite,
          size: 18,
          color: const Color(0xFF2962FF),
        ),
        Padding(
          padding: padding ?? const EdgeInsets.only(right: 4),
        ),
        MyRegularText(
          label: text ?? '',
          color: Colors.black,
          fontSize: fontSize,
          letterSpacing: 0, fontWeight: FontWeight.bold,
        ),

      ],
    );
  }
}
