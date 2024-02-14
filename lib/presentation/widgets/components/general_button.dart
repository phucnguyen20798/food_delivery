import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String content;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isOutlineBorder;
  final Function() onClick;

  const GeneralButton({
    super.key,
    required this.content,
    required this.onClick,
    this.backgroundColor,
    this.textColor,
    this.isOutlineBorder,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 48.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
        side: isOutlineBorder == true
            ? BorderSide(color: Colors.green.shade700, width: 1.0)
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
