import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/auth/cubit/auth_cubit.dart';
import 'package:medlife_v2/features/auth/cubit/auth_state.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';
import 'package:medlife_v2/ui/widgets/defult_form_field.dart';
import 'package:medlife_v2/utils/helper_methods.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen();

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final resetPassword = AuthCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 73.h),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Image.asset("assets/images/splsh logo.png"),
              ),
              SizedBox(
                height: 70.h,
              ),
              Text(
                "Reset Password",
                style: openSans24W600(color: AppColors.primary),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "please enter your mail address to resets your password",
                style: openSans16W400(
                  color: const Color(0xff1A1A1A).withOpacity(0.6),
                ).copyWith(
                  letterSpacing: -0.41,
                ),
              ),
              SizedBox(
                height: 37.h,
              ),
              DefaultFormField(
                controller: emailController,
                type: TextInputType.emailAddress,
                validate: validateEmail,
                label: "Email",
              ),
              SizedBox(
                height: 31.h,
              ),
              BlocListener<AuthCubit, AuthState>(
                listener: (_, state) {
                  if (state is PasswordResetRequestSent) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'A password reset code has been sent to your email.',
                        ),
                      ),
                    );
                  }
                },
                child: DefaultTextButton(
                  function: () {
                    resetPassword.requestPasswordReset(emailController.text);
                  },
                  text: "Send",
                  textStyle: openSans14W500(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
