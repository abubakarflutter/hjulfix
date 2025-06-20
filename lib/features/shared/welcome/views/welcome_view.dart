import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/configs/app_configs.dart';
import '../../../../core/routes/route_paths.dart';
import '../../../../test_button.dart';

class WelcomeView extends ConsumerWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo/welcome_screen_wheel.jpg', height: 250.h),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: AppConfigs.appFontFamily,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                6.horizontalSpace,
                Image.asset(
                  'assets/logo/hjulfix-without-wheel.png',
                  width: 110.w,
                ),
              ],
            ),
            6.verticalSpace,
            Text(
              'Professional rim renovation and powder coating',
              style: TextStyle(
                color: Color(0xff6C7278),
                fontFamily: AppConfigs.appFontFamily,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),

            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(
                  colors: [const Color(0xFFF7F7F7), const Color(0xFFFFFFFF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // stops: [0.0, 1.0],
                  // tileMode: TileMode.clamp
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.8.r),
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 0.78,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/lang-icon.svg',
                      height: 22.sp,
                      // colorFilter: ColorFilter.mode(Colors., blendMode),
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    'Select Language',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: AppConfigs.appFontFamily,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    'Choose your favorite language',
                    style: TextStyle(
                      color: Color(0xff6C7278),
                      fontFamily: AppConfigs.appFontFamily,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: AppColors.borderColor,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/lang-english.png',
                                height: 28.sp,
                              ),
                              14.verticalSpace,
                              const Divider(
                                color: AppColors.borderColor,
                                height: 0,
                                thickness: 0.75,
                              ),
                              16.verticalSpace,
                              Text(
                                'English',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: AppConfigs.appFontFamily,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      12.horizontalSpace,
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: AppColors.borderColor,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/lang-danish.png',
                                height: 28.sp,
                              ),
                              14.verticalSpace,
                              const Divider(
                                color: AppColors.borderColor,
                                height: 0,
                                thickness: 0.75,
                              ),
                              16.verticalSpace,
                              Text(
                                'Danish',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: AppConfigs.appFontFamily,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  CustomButton(text: "Continue", onPressed: () {
                    context.push(RoutePaths.login);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}