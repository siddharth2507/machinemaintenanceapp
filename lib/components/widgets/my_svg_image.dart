
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class MySvgImage extends StatelessWidget {
  final String path;
  final Color? color;
  final double? height;
  final double? width;
  final BoxFit fit;

  const MySvgImage({
    Key? key,
    required this.path,
    this.color,
    this.height,
    this.width,
    this.fit = BoxFit.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path.toString(),
      color: color,
      width: height,
      height: width,
      fit: fit,
      alignment: Alignment.center,
    );
  }
}

