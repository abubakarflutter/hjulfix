import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../test_button.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            // Drag Handle
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 12.0),
            //   child: Container(
            //     width: 40,
            //     height: 4,
            //     decoration: BoxDecoration(
            //       color: Colors.grey[400],
            //       borderRadius: BorderRadius.circular(2),
            //     ),
            //   ),
            // ),

            Container(
              padding: EdgeInsets.only(
                top: 12.h,
                left: 16.w,
                right: 16.w,
                bottom: 16.h,
              ),
              color: AppColors.textGreyishLightest.withValues(alpha: .4),

              child: Column(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(AppAssets.doubleArrowDownIcon)),
                  /// Header
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/wheel-side.png',
                        height: 30.h,
                      ),
                      10.horizontalSpace,
                      AppText(
                          'Selected Products (02)',
                          style: FigmaTextStyles.headline05SemiBold
                      ),

                      const Spacer(),


                      SizedBox(
                        width: 120.w,
                        child: CustomButton(
                          text: "Add Selected",
                          buttonHeight: 38,
                          onPressed: (){},

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                itemCount: 20,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) => Container(
                  // margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppText.rich(
                              // 'Product Name Title will be displayed here',
                              segments: [
                                AppTextSegment(
                                  'Product Name Title will be displayed here',
                                  style: FigmaTextStyles.headline06SemiBold
                                      .copyWith(height: 1.5),
                                ),
                                AppTextSegment(
                                  '   @ 1,250.95 KR',
                                  style: FigmaTextStyles.headline07Medium
                                      .copyWith(
                                    color: AppColors.textGreyishLighter,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  // style: FigmaTextStyles.headline07Regular
                                  //     .copyWith(fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                          5.horizontalSpace,

                          Material(
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(100.r),
                              child: Container(
                                height: 25.h,
                                width: 25.h,
                                padding: EdgeInsets.all(3).w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  AppAssets.editPenIcon,
                                ),
                              ),
                            ),
                          ),
                          9.horizontalSpace,
                          Material(
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(100.r),
                              child: Container(
                                height: 26.h,
                                width: 26.h,
                                padding: EdgeInsets.all(4).w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  AppAssets.trashIcon,
                                  colorFilter: ColorFilter.mode(
                                    Colors.red,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        height: 24.h,
                        color: AppColors.borderColor,
                        indent: 12.w,
                        endIndent: 12.w,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //----- Quantity
                          Expanded(
                            flex: 2,

                            child: Container(
                              // color: Colors.red,
                              child: Row(
                                children: [
                                  AppText(
                                    'Qty:',
                                    style: FigmaTextStyles.headline07SemiBold,
                                  ),
                                  9.horizontalSpace,
                                  AppText(
                                    '10',
                                    style: FigmaTextStyles.headline07Medium
                                        .copyWith(
                                      color: AppColors.textGreyishLighter,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // 12.horizontalSpace,

                          //----- Discount
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                AppText(
                                  'Disc:',
                                  style: FigmaTextStyles.headline07SemiBold,
                                ),
                                9.horizontalSpace,
                                AppText(
                                  '90% OFF',
                                  style: FigmaTextStyles.headline07Medium
                                      .copyWith(
                                    color: AppColors.textGreyishLighter,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //----- Total Price
                          Expanded(
                            flex: 3,
                            child: Row(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.emptyWalletIcon,
                                  height: 15.sp,
                                  // colorFilter: ColorFilter,
                                ),
                                7.horizontalSpace,
                                AppText(
                                  '690 DKK',
                                  style: FigmaTextStyles.headline07SemiBold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}