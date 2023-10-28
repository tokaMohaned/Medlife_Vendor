import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class CustomAddressRow extends StatelessWidget {
  final String text;
  final IconData icon;

  const CustomAddressRow({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
          ),
          SizedBox(
            width: 7.w,
          ),
          Text(
            text,
            style:
                openSans12W400(color: const Color(0xff1A1A1A).withOpacity(0.9)),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
