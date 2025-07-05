import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hjulfix_new/core/app_resources/app_dimens.dart';
import 'package:hjulfix_new/core/shared/widgets/custom_text_field.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../test_button.dart';
import '../widgets/calendar_timeline.dart';

class CreateOfferView extends ConsumerWidget {
  const CreateOfferView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
      title: "Create Offer",
      showBack: true,
      body: Column(
        children: [
          18.verticalSpace,
          HorizontalCalendar(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 60)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (d) => debugPrint('Picked \$d'),
          ),
          20.verticalSpace,

          ///---- Select Contact
          // GestureDetector(
          //   onTap: () => context.pushNamed(Routes.selectContactView),
          //   child: Container(
          //     margin: EdgeInsets.symmetric(
          //       horizontal: AppDimensions.viewHorizontalPadding,
          //     ),
          //     padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 12.h),
          //     decoration: BoxDecoration(
          //       color: Color(0xffFAFAFA),
          //       borderRadius: BorderRadius.circular(10.r),
          //       border: Border.all(color: AppColors.borderColor, width: 1),
          //     ),
          //     child: Row(
          //       children: [
          //         SvgPicture.asset(
          //           AppAssets.userIcon,
          //           height: 19.h,
          //           colorFilter: ColorFilter.mode(
          //             AppColors.primary,
          //             BlendMode.srcIn,
          //           ),
          //         ),
          //         14.horizontalSpace,
          //         Expanded(
          //           child: AppText(
          //             'Select Contact',
          //             style: FigmaTextStyles.headline05SemiBold,
          //           ),
          //         ),
          //         SvgPicture.asset(
          //           AppAssets.arrowRightIcon,
          //           colorFilter: ColorFilter.mode(
          //             AppColors.textPrimary,
          //             BlendMode.srcIn,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // 20.verticalSpace,

          ///----- Selected Contact
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppDimensions.viewHorizontalPadding,
            ),
            padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Color(0xffFAFAFA),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.borderColor, width: 1),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.userIcon,
                      height: 19.h,
                      colorFilter: ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    14.horizontalSpace,
                    Expanded(
                      child: AppText(
                        'Lasse Fisler J',
                        style: FigmaTextStyles.headline05SemiBold,
                      ),
                    ),
                    SvgPicture.asset(
                      AppAssets.arrowRightIcon,
                      colorFilter: ColorFilter.mode(
                        AppColors.textPrimary,
                        BlendMode.srcIn,
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
                  children: [
                    AppText(
                      'Email:',
                      style: FigmaTextStyles.headline06SemiBold,
                    ),
                    12.horizontalSpace,
                    AppText(
                      'AbubakarFlutter@gmail.com',
                      style: FigmaTextStyles.headline07Medium.copyWith(
                        color: AppColors.textGreyishLighter,
                      ),
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  children: [
                    AppText(
                      'Phone:',
                      style: FigmaTextStyles.headline06SemiBold,
                    ),
                    12.horizontalSpace,
                    AppText(
                      '03441771877',
                      style: FigmaTextStyles.headline07Medium.copyWith(
                        color: AppColors.textGreyishLighter,
                      ),
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  children: [
                    AppText(
                      'Address:',
                      style: FigmaTextStyles.headline07SemiBold,
                    ),
                    12.horizontalSpace,
                    AppText(
                      'Gladsaxe Møllevej 21, 2860 Søborg',
                      style: FigmaTextStyles.headline07Medium.copyWith(
                        color: AppColors.textGreyishLighter,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ///----- Add Products / Services
          Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.viewHorizontalPadding,
              right: AppDimensions.viewHorizontalPadding,
              top: 20.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.productBoxIcon,
                          height: 12.sp,
                          colorFilter: ColorFilter.mode(
                            AppColors.textPrimary,
                            BlendMode.srcIn,
                          ),
                        ),
                        6.horizontalSpace,
                        AppText(
                          'Add Product/Services',
                          style: FigmaTextStyles.headline07SemiBold,
                        ),
                      ],
                    ),
                    AppText(
                      '(3 Added)',
                      style: FigmaTextStyles.headline07Regular.copyWith(
                        color: AppColors.textGreyishLighter,
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                ...List.generate(
                  3,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 10),
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
              ],
            ),
          ),

          ///----- Add Comments
          Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.viewHorizontalPadding,
              right: AppDimensions.viewHorizontalPadding,
              top: 28.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.commentIcon,
                      height: 12.sp,
                      colorFilter: ColorFilter.mode(
                        AppColors.textPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                    6.horizontalSpace,
                    AppText(
                      'Add Comments',
                      style: FigmaTextStyles.headline07SemiBold,
                    ),
                  ],
                ),
                10.verticalSpace,
                GlobalTextField(
                  maxLines: 4,
                  hintText: 'Enter any comments here',
                ),
              ],
            ),
          ),

          20.verticalSpace,
        ],
      ),
      bottomBar: Container(
        height: 140.h,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          left: AppDimensions.viewHorizontalPadding,
          right: AppDimensions.viewHorizontalPadding,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.075),
              blurRadius: 10,
              offset: Offset(0, -5), // Negative y-offset for upper shadow
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppText(
                    'Sub total',
                    style: FigmaTextStyles.headline07SemiBold.copyWith(
                      color: AppColors.textGreyishLightest,
                    ),
                  ),
                ),
                Expanded(
                  child: AppText(
                    '18,500 Kr',
                    style: FigmaTextStyles.headline07SemiBold.copyWith(
                      color: AppColors.textGreyishLightest,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            4.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppText(
                    'VAT (25.00%)',
                    style: FigmaTextStyles.headline07SemiBold.copyWith(
                      color: AppColors.textGreyishLightest,
                    ),
                  ),
                ),
                Expanded(
                  child: AppText(
                    '2,500 Kr',
                    style: FigmaTextStyles.headline07SemiBold.copyWith(
                      color: AppColors.textGreyishLightest,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            4.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppText(
                    'Total',
                    style: FigmaTextStyles.headline05Bold.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: AppText(
                    '22,500 Kr',
                    style: FigmaTextStyles.headline05Bold.copyWith(
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Add Custom Product',
                    isOutlined: true,
                    onPressed: () {},
                  ),
                ),
                10.horizontalSpace,
                Expanded(child: CustomButton(text: 'Send Offer')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
