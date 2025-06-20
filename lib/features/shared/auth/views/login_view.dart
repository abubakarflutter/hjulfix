import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_dimens.dart';
import '../../../../core/configs/app_configs.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.viewHorizontalPadding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            34.verticalSpace,
            Text(
              'Sign in to your Account',
              style: TextStyle(
                color: Colors.black,
                fontFamily: AppConfigs.appFontFamily,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            5.verticalSpace,
            Text(
              'Enter your email and password to log in ',
              style: TextStyle(
                color: Color(0xff6C7278),
                fontFamily: AppConfigs.appFontFamily,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            34.verticalSpace,

            GlobalTextField(
              labelText: 'Email Address',
            ),
            16.verticalSpace,
            GlobalTextField(
              labelText: 'Password',
              isObscure: true,
            ),
            16.verticalSpace,
            Row(
              children: [
                Row(
                  children: [

                    //---- Animated Checkbox
                    Container(
                      height: 20.h,
                      width: 20.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                          color: AppColors.textSecondaryGreyish,
                        )
                      ),
                    ),
                    5.horizontalSpace,
                    Text('Remember me',
                   style:   TextStyle(
                          fontSize: 12.sp,
                          fontFamily: AppConfigs.appFontFamily,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondaryGreyish
                      ),
                    ),


                  ],
                ),
                GestureDetector(
                  onTap: () => HapticFeedback.lightImpact(),
                  child: Text('Forgot Password ?',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontFamily: AppConfigs.appFontFamily,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            35.verticalSpace,
            CustomButton(text: "Log In", onPressed: () {
              // context.push(RoutePaths.login);
            }),

          ],
        ),
      ),
    );
  }
}