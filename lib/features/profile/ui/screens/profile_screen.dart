import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/auth/cubit/auth_cubit.dart';
import 'package:medlife_v2/features/auth/cubit/auth_state.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/features/profile/cubit/profile_state.dart';
import 'package:medlife_v2/features/profile/ui/widgets/profile_container.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_button.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';
import 'package:medlife_v2/utils/data/models/vendor.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

TextEditingController idNumberController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController dateOfBirthController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController companyInsuranceNameController = TextEditingController();
TextEditingController crNumberController = TextEditingController();
TextEditingController vatNumberController = TextEditingController();
TextEditingController bankNameController = TextEditingController();
TextEditingController ibanNumberController = TextEditingController();
TextEditingController accountNumberController = TextEditingController();

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final profile = ProfileCubit.get(context).vendor;
    idNumberController.text = profile.idNumber!;
    firstNameController.text = profile.firstName!;
    lastNameController.text = profile.lastName!;
    emailController.text = profile.email!;
    dateOfBirthController.text = profile.crNumber!;
    addressController.text = profile.address!;
    companyInsuranceNameController.text = profile.companyInsuranceName!;
    crNumberController.text = profile.crNumber!;
    vatNumberController.text = profile.vatNumber!;
    bankNameController.text = profile.bankName!;
    ibanNumberController.text = profile.ibanNumber!;
    accountNumberController.text = profile.accountNumber!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (_, state) {
        if (state is UpdateUserSuccess) {
          ProfileCubit.get(context).getVendor();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 29.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "Profile",
                    style: openSans16W500(color: const Color(0xff1E1E1E)),
                  ),
                  SizedBox(
                    width: 135.h,
                  ),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoading) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      } else {
                        Navigator.pop(context);
                        if (state is LoggedOut) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Successfully logout",
                                style: TextStyle(fontSize: 15),
                              ),
                              backgroundColor: AppColors.primary,
                              duration: Duration(seconds: 3),
                            ),
                          );
                        } else if (state is AuthError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "There is an error",
                                style: TextStyle(fontSize: 15),
                              ),
                              backgroundColor: AppColors.primary,
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      }
                    },
                    child: DefaultButton(
                      width: 40,
                      height: 50,
                      function: () {
                        AuthCubit.get(context).logout();
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      icon: Icons.logout_outlined,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              ProfileContainer(
                labelText: "ID Number",
                textInputType: TextInputType.number,
                controller: idNumberController,
              ),
              SizedBox(
                height: 21.h,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  children: [
                    Expanded(
                      child: ProfileContainer(
                        labelText: "First Name",
                        textInputType: TextInputType.name,
                        controller: firstNameController,
                      ),
                    ),
                    SizedBox(
                      width: 20.h,
                    ),
                    Expanded(
                      child: ProfileContainer(
                        labelText: "Last Name",
                        textInputType: TextInputType.name,
                        controller: lastNameController,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              ProfileContainer(
                labelText: "Email",
                textInputType: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(
                height: 21.h,
              ),
              ProfileContainer(
                labelText: "Address*",
                textInputType: TextInputType.streetAddress,
                controller: addressController,
              ),
              SizedBox(
                height: 21.h,
              ),
              ProfileContainer(
                labelText: "Company insurance name",
                textInputType: TextInputType.text,
                controller: companyInsuranceNameController,
              ),
              SizedBox(
                height: 21.h,
              ),
              ProfileContainer(
                labelText: "CR Number",
                textInputType: TextInputType.text,
                controller: crNumberController,
              ),
              SizedBox(
                height: 21.h,
              ),
              ProfileContainer(
                labelText: "VAT Number",
                textInputType: TextInputType.text,
                controller: vatNumberController,
              ),
              SizedBox(
                height: 36.h,
              ),
              Text(
                "Bank account details",
                style: openSans14W500(color: AppColors.primary),
              ),
              SizedBox(
                height: 20.h,
              ),
              ProfileContainer(
                labelText: "Bank Name",
                textInputType: TextInputType.text,
                controller: bankNameController,
              ),
              SizedBox(
                height: 21.h,
              ),
              ProfileContainer(
                labelText: "IBAN Number",
                textInputType: TextInputType.text,
                controller: ibanNumberController,
              ),
              SizedBox(
                height: 21.h,
              ),
              ProfileContainer(
                labelText: "Account Number",
                textInputType: TextInputType.text,
                controller: accountNumberController,
              ),
              SizedBox(
                height: 39.h,
              ),
              BlocListener<ProfileCubit, ProfileState>(
                listener: (_, state) {
                  if (state is UpdateUserSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Successfully Updated",
                          style: TextStyle(fontSize: 15),
                        ),
                        backgroundColor: AppColors.primary,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
                child: DefaultTextButton(
                  function: () {
                    ProfileCubit.get(context).updateVendor(
                      Vendor(
                        id: ProfileCubit.get(context).vendor.id,
                        idNumber: idNumberController.text,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        address: addressController.text,
                        companyInsuranceName:
                            companyInsuranceNameController.text,
                        crNumber: crNumberController.text,
                        accountNumber: accountNumberController.text,
                        bankName: bankNameController.text,
                        ibanNumber: ibanNumberController.text,
                        vatNumber: vatNumberController.text,
                      ),
                    );
                  },
                  text: "Save changes",
                ),
              ),
              SizedBox(
                height: 110.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
