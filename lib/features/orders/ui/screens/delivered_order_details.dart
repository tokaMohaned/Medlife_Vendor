import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/orders/data/models/order.dart';
import 'package:medlife_v2/features/orders/ui/widgets/custom_address_container.dart';
import 'package:medlife_v2/features/orders/ui/widgets/order_request.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/custom_divider.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';
import 'package:medlife_v2/ui/widgets/summery_row.dart';

class DeliveredOrderDetails extends StatelessWidget {
  const DeliveredOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final deliveredOrder = ModalRoute.of(context)!.settings.arguments! as Order;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 17.w,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 44.w,
                        height: 42.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11.76.r),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x23EA6A58),
                              blurRadius: 20,
                              offset: Offset(0, 4.41),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 100.w),
                    Text(
                      "Request Details",
                      style: openSans16W500(color: const Color(0xff576A69)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: const Color(0xff2CB742),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Status : ${deliveredOrder.status}"),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Shipping Address",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomAddressContainer(
                  orderDetails: deliveredOrder,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Shipping Method",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 18.h, horizontal: 7.w),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          deliveredOrder.buyer.address?.place ?? "",
                          style: openSans12W600(color: const Color(0xff1A1A1A)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  "Payment Method",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 18.h, horizontal: 7.w),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          deliveredOrder.paymentMethod,
                          style: openSans12W600(color: const Color(0xff1A1A1A)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                Text(
                  "Order request",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 15.h,
                ),
                RequestOrder(medicalEquipmentsDetails: deliveredOrder,),
                SizedBox(
                  height: 23.h,
                ),
                Text(
                  "Order Summery",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 9.h,
                ),
                SummeryRow(
                  text: 'Delivery Fee',
                  price: '+${deliveredOrder.orderCost.deliveryFee} SAR',
                ),
                SizedBox(
                  height: 11.h,
                ),
                SummeryRow(
                  text: 'SubTotal',
                  price: '+${deliveredOrder.orderCost.subtotal} SAR',
                ),
                SizedBox(
                  height: 11.h,
                ),
                SummeryRow(
                  text: 'Bat',
                  price: '+${deliveredOrder.orderCost.taxes} SAR',
                ),
                SizedBox(
                  height: 16.h,
                ),
                const CustomDivider(),
                SizedBox(
                  height: 16.h,
                ),
                SummeryRow(
                  text: 'Total',
                  price: "${deliveredOrder.orderCost.total}",
                ),
                SizedBox(
                  height: 18.h,
                ),
                DefaultTextButton(
                  function: () {},
                  text: "Download Card",
                  textStyle: openSans16W500(color: const Color(0xff1A1A1A)),
                  height: 65.h,
                  width: double.infinity,
                  backgroundColor: Colors.white,
                  borderColor: AppColors.primary,
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
