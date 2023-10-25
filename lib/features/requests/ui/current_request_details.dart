import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/requests/widgets/custom_address_container.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

import '../../../ui/resources/text_styles.dart';

class CurrentRequestDetails extends StatelessWidget {
  const CurrentRequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
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
                  SizedBox(width: 140.w),
                  Text(
                    "Request Details",
                    style: openSans16W500(color: const Color(0xff576A69)),
                  ),
                ],
              ),
              SizedBox(
                height: 29.h,
              ),
              Text(
                "Shipping Address",
                style: openSans14W500(color: AppColors.primary),
              ),
              SizedBox(
                height: 8.h,
              ),
              const CustomAddressContainer(),
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
                        "Home delivery",
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
                        "Cash payment",
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
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.11 *4,
                  // minWidth: MediaQuery.sizeOf(context)
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 9.h, horizontal: 5.w),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Image.asset(
                                        "assets/images/Compression device.png"),
                                    SizedBox(
                                      width: 9.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Compression device",
                                          style: openSans14W400(
                                            color: Color(0xff576A69),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: '23',
                                                  style: openSans18W500(
                                                    color: Color(0xff576A69),
                                                  )),
                                              TextSpan(
                                                  text: 'ASR',
                                                  style: openSans14W400(
                                                      color:
                                                          AppColors.primary)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                              0.18,
                                    ),
                                    Text(
                                      "2",
                                      style: openSans16W500(
                                          color: Color(0xff1E1E1E)),
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 16.h);
                              },
                              itemCount: 4),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
