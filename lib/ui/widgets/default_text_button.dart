import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

class DefaultTextButton extends StatelessWidget {
  final Function function;
  final String text;
  final TextStyle textStyle;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;

  const DefaultTextButton({
    required this.function,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.41,
      height: 0.09,
    ),
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: width ?? 345.w,
        height: height ?? 56.h,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: TextButton(
          onPressed: function as void Function()?,
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
