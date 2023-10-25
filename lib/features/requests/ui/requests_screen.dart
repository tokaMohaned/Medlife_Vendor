import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/requests/ui/completed_requests.dart';
import 'package:medlife_v2/features/requests/ui/current_requests.dart';
import 'package:medlife_v2/features/requests/ui/new_requests.dart';

import '../../../ui/resources/app_colors.dart';
import '../../../ui/resources/text_styles.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 47.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Ahmed,",
                style: openSans18W500(color: const Color(0xff576A69)),
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                "Request",
                style: openSans16W500(color: AppColors.primary),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: const Color(0xfff1f4f6)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 0;
                          });
                        },
                        child: Container(
                          color: currentIndex == 0
                              ? AppColors.primary
                              : Color(0xfff1f4f6),
                          height: 40.h,
                          width: 90.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New",
                                style: currentIndex == 0
                                    ? openSans12W600(color: Colors.white)
                                    : openSans12W600(
                                        color: const Color(0xff1E1E1E)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 1;
                          });
                        },
                        child: Container(
                          color: currentIndex == 1
                              ? AppColors.primary
                              : Color(0xfff1f4f6),
                          height: 40.h,
                          width: 90.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Current",
                                style: currentIndex == 1
                                    ? openSans12W600(color: Colors.white)
                                    : openSans12W600(
                                        color: const Color(0xff1E1E1E)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        child: Container(
                          color: currentIndex == 2
                              ? AppColors.primary
                              : Color(0xfff1f4f6),
                          height: 40.h,
                          width: 90.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Completed",
                                style: currentIndex == 2
                                    ? openSans12W600(color: Colors.white)
                                    : openSans12W600(
                                        color: const Color(0xff1E1E1E)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              currentIndex == 0
                  ? NewRequests()
                  : currentIndex == 1
                      ? CurrentRequests()
                      : CompletedRequests(),
            ],
          ),
        ),
      ),
    );
  }
}
