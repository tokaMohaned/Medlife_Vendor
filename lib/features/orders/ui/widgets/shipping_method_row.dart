import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class ShippingMethodRow extends StatefulWidget {
  const ShippingMethodRow({super.key});

  @override
  State<ShippingMethodRow> createState() => _ShippingMethodRowState();
}

class _ShippingMethodRowState extends State<ShippingMethodRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.circle,
          color: AppColors.primary,
        ),
        SizedBox(width: 6.w),
        Text(
          "Home delivery",
          style: openSans12W600(color: const Color(0xff1A1A1A)),
        ),
      ],
    );
  }
}
