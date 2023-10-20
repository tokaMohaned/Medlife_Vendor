import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/home/ui/widgets/home_container.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

import '../../../../ui/widgets/default_text_button.dart';
import '../../../profile/cubit/profile_cubit.dart';
import '../../../../ui/resources/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController productNameController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController quantityController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 76.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello ${ProfileCubit.get(context).vendor.firstName} ,",
              style: openSans18W500(color: Colors.black),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Upload product",
              style: openSans14W500(color: AppColors.primary),
            ),
            SizedBox(
              height: 19.h,
            ),
            Text(
              "Product images",
              style: openSans14W400(
                  color: const Color(0xff1E1E1E).withOpacity(0.5)),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/Upload icon.png"),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      """Supported formats: JPEG, PNG, GIF, MP4,
                 PDF, PSD, AI, Word, PPT""",
                      style: openSans12W400(color: Color(0xff676767)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
            HomeContainer(
                labelText: "Product Name*",
                textInputType: TextInputType.text,
                controller: productNameController),
            SizedBox(
              height: 17.h,
            ),
            HomeContainer(
              labelText: "Description*",
              textInputType: TextInputType.text,
              controller: descriptionController,
              maxLines: 4,
            ),
            SizedBox(
              height: 17.h,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                children: [
                  Expanded(
                    child: HomeContainer(
                      labelText: "Price*",
                      textInputType: TextInputType.name,
                      controller: priceController,
                    ),
                  ),
                  SizedBox(
                    width: 20.h,
                  ),
                  Expanded(
                    child: HomeContainer(
                      labelText: "Quantity*",
                      textInputType: TextInputType.name,
                      controller: quantityController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 43.h,
            ),
            DefaultTextButton(
              function: () {},
              text: "Save changes",
            ),
          ],
        ),
      ),
    );
  }
}
