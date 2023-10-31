import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/orders/data/models/order.dart';
import 'package:medlife_v2/features/orders/ui/widgets/custom_address_row.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

class CustomAddressContainer extends StatelessWidget {
  final Order orderDetails;

  const CustomAddressContainer({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        children: [
          CustomAddressRow(
            icon: Icons.person_2_outlined,
            text: "${orderDetails.buyer.firstName} ${orderDetails.buyer.lastName}",
          ),
          SizedBox(
            height: 7.h,
          ),
          CustomAddressRow(
            icon: Icons.call_outlined,
            text: orderDetails.buyer.phoneNumber ?? "",
          ),
          SizedBox(
            height: 7.h,
          ),
          CustomAddressRow(
            icon: Icons.location_on_outlined,
            text: orderDetails.buyer.address?.addressDetails ?? '',
          ),
        ],
      ),
    );
  }
}
