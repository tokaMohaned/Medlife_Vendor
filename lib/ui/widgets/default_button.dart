import 'package:flutter/material.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

class DefaultButton extends StatelessWidget {
  final double? width;
  final double height;
  final Color? background;
  final TextStyle textStyle;
  final bool isUpperCase;
  final double radius;
  final Function function;
  final String? text;
  final IconData icon;
  final Color? iconColor;
  final Color? borderColor;
  final double? iconSize;

  const DefaultButton({
    this.width,
    this.height = 40,
    this.background,
    this.textStyle = const TextStyle(
      color: Colors.white,
    ),
    this.isUpperCase = true,
    this.radius = 8,
    required this.function,
    this.text,
    this.iconColor,
    this.borderColor,
    this.iconSize,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: width ?? constraints.maxWidth,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor ?? Colors.transparent),
            color: background ?? AppColors.primary,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: GestureDetector(
            onTap: function as void Function()?,
            child: Center(
              child: Icon(
                icon,
                color: iconColor ?? Colors.white,
                size: iconSize,
              ),
            ),
          ),
        );
      },
    );
  }
}
