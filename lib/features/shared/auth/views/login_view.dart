import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_dimens.dart';
import '../../../../core/configs/app_configs.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../test_button.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Container(
        //   color: Colors.red,
        // ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(
            top: 6
          ),
          child: Image.asset('assets/logo/hjulfix.png',
          width: 175.w,
          ),
        ),
      ),
      body: AutofillGroup(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.viewHorizontalPadding
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              34.verticalSpace,

              AppText(
                'Sign in to your Account',
                style: FigmaTextStyles.headline02Bold,
              ),
              5.verticalSpace,

              AppText(
                'Enter your email and password to log in',
                style:  FigmaTextStyles.headline07Medium.copyWith(
                    color: AppColors.textSecondaryGreyish
                ),
              ),



              34.verticalSpace,

              GlobalTextField(
                labelText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email], // Email autofill
              ),
              16.verticalSpace,
              GlobalTextField(
                labelText: 'Password',
                isObscure: true,
                autofillHints: const [AutofillHints.password], // Password autofill
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [

                      //---- Animated Checkbox
                      Container(
                        height: 16.h,
                        width: 16.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.r),
                          border: Border.all(
                            color: AppColors.textSecondaryGreyish,
                          )
                        ),
                      ),
                      7.horizontalSpace,
                      AppText(
                        'Remember me',
                        style:  FigmaTextStyles.headline07Medium.copyWith(
                            color: AppColors.textSecondaryGreyish
                        ),
                      ),



                    ],
                  ),


                  AppText(
                    'Forgot Password ?',
                    style:  FigmaTextStyles.headline07Medium.copyWith(
                        color: AppColors.primary
                    ),

                  ),

                  // GestureDetector(
                  //   onTap: () => HapticFeedback.lightImpact(),
                  //   child: Text('Forgot Password ?',
                  //     style: TextStyle(
                  //       color: AppColors.primary,
                  //       fontFamily: AppConfigs.appFontFamily,
                  //       fontSize: 12.sp,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // )
                ],
              ),
              35.verticalSpace,
              CustomButton(text: "Log In", onPressed: () {
                // context.push(RoutePaths.login);
              }),

              30.verticalSpace,


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                    style:   TextStyle(
                        fontSize: 12.sp,
                        fontFamily: AppConfigs.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondaryGreyish
                    ),
                  ),
                  6.horizontalSpace,
                  Text('Create an Account',
                    style:   TextStyle(
                        fontSize: 12.sp,
                        fontFamily: AppConfigs.appFontFamily,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary
                    ),
                  ),

                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}