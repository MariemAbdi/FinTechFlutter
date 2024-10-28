import 'package:finance_website/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomPositionedImage extends StatelessWidget {
  final double? top,right,bottom,left;
  final String assetPath;
  final double widthFactor, opacity;

  const CustomPositionedImage({
    Key? key,
    this.top,
    this.right,
    this.bottom,
    this.left,
    required this.assetPath,
    required this.widthFactor,
    this.opacity = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: SizedBox(
        width: Responsive.screenWidth(context) * widthFactor,
        child: Opacity(
          opacity: opacity,
          child: Image.asset(assetPath),
        ),
      ),
    );
  }
}
