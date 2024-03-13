import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class GeneralButton extends StatelessWidget {
  final String content;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isOutlineBorder;
  final Function() onClick;
  final double? width;
  final double? borderRadius;
  final Color? borderColor;

  const GeneralButton({
    super.key,
    required this.content,
    required this.onClick,
    this.backgroundColor,
    this.textColor,
    this.isOutlineBorder,
    this.width,
    this.borderRadius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width ?? double.infinity,
      height: 48.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 100.0),
        side: isOutlineBorder == true
            ? BorderSide(
                color: borderColor ?? AppColor.primaryColor, width: 1.0)
            : BorderSide.none,
      ),
      child: MaterialButton(
        onPressed: () {
          onClick();
        },
        elevation: 0.0,
        color: backgroundColor ?? Colors.white,
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: textColor ?? Colors.green.shade700,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
