import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/orders/cubit/orders_cubit.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class NewRequestsList extends StatelessWidget {
  const NewRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              Routes.newRequestDetails,
              arguments: OrdersCubit.get(context).orders[index],
            ),
            child: SizedBox(
              height: 70.h,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 40,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${OrdersCubit.get(context).orders[index].dateTime}".substring(0,10),
                            style:
                                openSans16W500(color: const Color(0xff27292D)),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Request Nom. : ${OrdersCubit.get(context).orders[index].id}",
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
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(thickness: 1);
        },
        itemCount: OrdersCubit.get(context).orders.length,
      ),
    );
  }
}
