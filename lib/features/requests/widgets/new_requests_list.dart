import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/route_manager.dart';

import '../../../ui/resources/text_styles.dart';

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
              onTap: () =>
                  Navigator.pushNamed(context, Routes.newRequestDetails),
              child: SizedBox(
                height: 70.h,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
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
                              "Amira Ahmed",
                              style: openSans16W500(color: Color(0xff27292D)),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "Request Nom. : #1524666",
                              style: openSans12W400(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        )
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
            return Divider(thickness: 1);
          },
          itemCount: 40),
    );
  }
}
