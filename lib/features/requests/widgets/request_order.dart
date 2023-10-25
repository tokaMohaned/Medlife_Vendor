import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class RequestOrder extends StatelessWidget {
  const RequestOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.11 * 4,
        // minWidth: MediaQuery.sizeOf(context)
      ),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(5.r)),
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
                          Image.asset("assets/images/Compression device.png"),
                          SizedBox(
                            width: 9.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                            color: AppColors.primary)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.18,
                          ),
                          Text(
                            "2",
                            style: openSans16W500(color: Color(0xff1E1E1E)),
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
    );
  }
}
