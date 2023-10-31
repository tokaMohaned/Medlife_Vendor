import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/orders/cubit/orders_cubit.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class CurrentOrdersList extends StatelessWidget {
  const CurrentOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersCubit = OrdersCubit.get(context);
    final acceptedOrders = ordersCubit.acceptedOrders;
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: acceptedOrders.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              Routes.currentRequestDetails,
              arguments: acceptedOrders[index],
            ),
            child: SizedBox(
              height: 85.h,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 40,
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${acceptedOrders[index].buyer.firstName} ${acceptedOrders[index].buyer.lastName}",
                            style:
                                openSans16W500(color: const Color(0xff27292D)),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Order Nom. : ${acceptedOrders[index].id}",
                            style: openSans12W400(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "Date Time: ${acceptedOrders[index].dateTime}".substring(0,22),
                            style: openSans12W400(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
