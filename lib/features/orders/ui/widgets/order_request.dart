import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/orders/data/models/order.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class RequestOrder extends StatelessWidget {
  final Order medicalEquipmentsDetails;

  const RequestOrder({super.key, required this.medicalEquipmentsDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.11 * medicalEquipmentsDetails.cartMedicalEquipments.length,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 5.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        height: 76.h,
                        width: 76.w,
                        child: Image.network(
                          medicalEquipmentsDetails.cartMedicalEquipments[index].medicalEquipment.imagesUrls.first,
                        ),
                      ),
                      SizedBox(width: 9.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            medicalEquipmentsDetails.cartMedicalEquipments[index].medicalEquipment.title,
                            style: openSans14W400(
                              color: const Color(0xff576A69),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${medicalEquipmentsDetails.cartMedicalEquipments[index].medicalEquipment.price}",
                                  style: openSans18W500(
                                    color: const Color(0xff576A69),
                                  ),
                                ),
                                TextSpan(
                                  text: 'ASR',
                                  style: openSans14W400(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                      Text(
                        "${medicalEquipmentsDetails.cartMedicalEquipments[index].quantity}",
                        style: openSans16W500(color: const Color(0xff1E1E1E)),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16.h);
                },
                itemCount: medicalEquipmentsDetails.cartMedicalEquipments.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
