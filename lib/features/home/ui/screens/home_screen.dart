import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlife_v2/features/home/cubit/home_cubit.dart';
import 'package:medlife_v2/features/home/cubit/home_state.dart';
import 'package:medlife_v2/features/home/ui/widgets/home_container.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';
import 'package:medlife_v2/ui/widgets/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController productNameController = TextEditingController();
TextEditingController brandNameController = TextEditingController();
TextEditingController productTypeController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController quantityController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  List<File> imageFiles = [];
  List<File> imageNames = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          top: 36.h,
          left: 16.0.w,
          right: 16.w,
          bottom: MediaQuery.of(context).viewInsets.bottom * 1,
        ),
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
                color: const Color(0xff1E1E1E).withOpacity(0.5),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            InkWell(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                final List<XFile> xFiles = await picker.pickMultiImage();
                if (xFiles.isNotEmpty) {
                  File xFilePathToFile(XFile xFile) {
                    return File(xFile.path);
                  }

                  File xFileNameToFile(XFile xFile) {
                    return File(xFile.name);
                  }

                  imageFiles =
                      xFiles.map((xFile) => xFilePathToFile(xFile)).toList();
                  imageNames =
                      xFiles.map((xFile) => xFileNameToFile(xFile)).toList();
                  setState(() {});
                }
              },
              child: Container(
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
                      if (imageFiles.isEmpty)
                        Text(
                          """
Supported formats: JPEG, PNG, GIF, MP4,
                   PDF, PSD, AI, Word, PPT""",
                          style: openSans12W400(color: const Color(0xff676767)),
                        )
                      else
                        SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  itemBuilder: (context, index) => Center(
                                    child: Text(
                                      imageNames[index].toString().substring(5),
                                    ),
                                  ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 5.h,
                                  ),
                                  itemCount: imageNames.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
            HomeContainer(
              labelText: "Product Name*",
              textInputType: TextInputType.text,
              controller: productNameController,
            ),
            SizedBox(
              height: 17.h,
            ),
            HomeContainer(
              labelText: "Brand Name*",
              textInputType: TextInputType.text,
              controller: brandNameController,
            ),
            SizedBox(
              height: 17.h,
            ),
            HomeContainer(
              labelText: "Product Type*",
              textInputType: TextInputType.text,
              controller: productTypeController,
            ),
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
            BlocListener<HomeCubit, HomeState>(
              listener: (_, state) {
                if (state is UploadMedicalEquipmentsLoading ||
                    state is UploadMedicalEquipmentImagesLoading) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const LoadingIndicator();
                    },
                  );
                } else {
                  Navigator.pop(context);
                  if (state is UploadMedicalEquipmentsError ||
                      state is UploadMedicalEquipmentsImagesError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Failed to Upload",
                          style: TextStyle(fontSize: 15),
                        ),
                        backgroundColor: AppColors.error,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                  if (state is UploadMedicalEquipmentsSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Successfully Uploaded",
                          style: TextStyle(fontSize: 15),
                        ),
                        backgroundColor: AppColors.primary,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                }
              },
              child: DefaultTextButton(
                function: () {
                  final newMedicalEquipment = MedicalEquipment(
                    title: productNameController.text,
                    description: descriptionController.text,
                    price: double.parse(priceController.text),
                    vendorName:
                        "${ProfileCubit.get(context).vendor.firstName!} ${ProfileCubit.get(context).vendor.lastName!}",
                    vendorId: ProfileCubit.get(context).vendor.id ?? "",
                    brand: brandNameController.text,
                    productType: productTypeController.text,
                    createdAt: DateTime.now(),
                    imagesUrls: [],
                  );
                  HomeCubit.get(context)
                      .uploadMedicalEquipmentImagesToFireStorage(imageFiles)
                      .whenComplete(
                        () => HomeCubit.get(context)
                            .uploadMedicalEquipmentToFireStore(
                          newMedicalEquipment,
                          imageFiles,
                        ),
                      );
                },
                text: "Upload product",
              ),
            ),
            SizedBox(
              height: 90.h,
            ),
          ],
        ),
      ),
    );
  }
}
