import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? function;
  final double buttonFontSize;
  final double? verticalPadding, horizontalPadding;
  final Color? buttonColor, buttonHoverColor, textHoverColor, textColor;
  final bool isFilled;

  const CustomButton({
    super.key,
    this.text = "",
    this.isFilled = true,
    this.verticalPadding,
    this.horizontalPadding,
    this.buttonColor,
    this.textHoverColor,
    this.buttonHoverColor,
    this.buttonFontSize = 18,
    required this.function,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: isFilled
          ? ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return textHoverColor; // When hovered
                }
                return textColor; // By default
              }),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return buttonHoverColor; // When hovered
                }
                return buttonColor; // By default
              }),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
                vertical: verticalPadding ?? 25,
                horizontal: horizontalPadding ?? 40),
          ),
          textStyle: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: buttonFontSize); // Default and hovered
              }),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: TextStyle(fontSize: buttonFontSize, color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      )
          : OutlinedButton(
        onPressed: function,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return textHoverColor; // When hovered
                }
                return textColor; // By default
              }),
          side: MaterialStateProperty.resolveWith<BorderSide?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return BorderSide(color: buttonHoverColor ?? Colors.blue);
                }
                return BorderSide(color: buttonColor ?? Colors.blue);
              }),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
                vertical: verticalPadding ?? 25,
                horizontal: horizontalPadding ?? 40),
          ),
          textStyle: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: buttonFontSize); // Default and hovered
              }),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: TextStyle(fontSize: buttonFontSize, color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
