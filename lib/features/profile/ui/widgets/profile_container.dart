import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class ProfileContainer extends StatefulWidget {
  final TextEditingController controller;
  final void Function()? onTap;
  final void Function()? suffixPressed;
  final bool? isClickable;
  final int? maxLines;
  final TextInputType textInputType;
  final String labelText;
  final IconData? icon;

  const ProfileContainer({
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
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  bool _isCalenderVisible = false;
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat("d/MM/yyyy");

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
          controller: widget.controller,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            suffixIcon: widget.icon != null
                ? IconButton(
                    onPressed: () {
                      if (widget.icon != null) {
                        setState(() {
                          _isCalenderVisible = !_isCalenderVisible;
                        });
                      }
                    },
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
        Visibility(
          visible: _isCalenderVisible,
          child: CalendarDatePicker(
            initialDate: _selectedDate,
            firstDate: DateTime(1975),
            lastDate: DateTime.now(),
            onDateChanged: (value) => {
              setState(() {
                _selectedDate = value;
                if (widget.icon != null) {
                  setState(() {
                    widget.controller.text = _dateFormat.format(_selectedDate);
                  });
                }
                _isCalenderVisible = !_isCalenderVisible;
              }),
            },
          ),
        ),
      ],
    );
  }
}

/*
 InkWell(
          onTap: () {
            if(widget.icon != null) {
              setState(() {
                _isCalenderVisible = !_isCalenderVisible;
              });
            }
          },
          child: Container(
            height: 46.h,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width - 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor, width: 2.w),
              borderRadius: BorderRadius.circular(7.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(widget.icon != null ? _dateFormat.format(_selectedDate) : widget.containerText),
                  const Spacer(),
                  Icon(
                    widget.icon,
                    color: AppColors.borderColor,
                  ),
                ],
              ),
            ),
          ),
        ),
 */
