import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class HomeContainer extends StatefulWidget {
  final TextEditingController controller;
  final void Function()? onTap;
  final void Function()? suffixPressed;
  final bool? isClickable;
  final int? maxLines;
  final TextInputType textInputType;
  final String labelText;
  final IconData? icon;

  const HomeContainer({
    required this.labelText,
    required this.textInputType,
    this.icon,
    required this.controller,
    this.onTap,
    this.suffixPressed,
    this.isClickable,
    this.maxLines,
  });

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style:
              openSans14W400(color: const Color(0xff1E1E1E).withOpacity(0.5)),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextField(
          maxLines: widget.maxLines ?? 1,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            suffixIcon: widget.icon != null
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      widget.icon,
                      color: AppColors.primary,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
              borderRadius: BorderRadius.circular(7.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
              borderRadius: BorderRadius.circular(7.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor, width: 2.w),
              borderRadius: BorderRadius.circular(7.r),
            ),
          ),
        ),
      ],
    );
  }
}
