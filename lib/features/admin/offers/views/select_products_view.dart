import 'package:flutter/material.dart';
import 'package:flutter_multiple_loaders/flutter_multiple_loaders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hjulfix_new/core/app_resources/app_dimens.dart';
import 'package:hjulfix_new/features/admin/offers/views/selected_products_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';
import '../../../../core/shared/widgets/custom_confrmation_sheet.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../test_button.dart';

class SelectProductView extends ConsumerWidget {
  const SelectProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
      title: "Select Product",
      showBack: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.viewHorizontalPadding,
          vertical: AppDimensions.viewHorizontalPadding,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GlobalTextField(
                    hintText: 'Search Product',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 14.w,
                    ),
                    prefixWidget: Padding(
                      padding: EdgeInsets.only(left: 14.w, right: 8.w),
                      child: SvgPicture.asset(AppAssets.searchIcon),
                    ),
                  ),
                ),
              ],
            ),
            18.verticalSpace,
            ...List.generate(
              6,
              (index) => GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(bottom: index == 5 ? 0 : 10.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.borderColor, width: 1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/wheel-side.png',
                            // 'assets/images/wheel-side-2.png',
                            height: 33.h,
                          ),
                          14.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  'Af-og pamontering af hjul pa bil',
                                  // 'Af-og pamontering af hjul pa bil afdsafs dsdfr r',
                                  maxLines: 2,
                                  style: FigmaTextStyles.headline05Bold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        endIndent: 10.w,
                        indent: 10.w,
                        height: 20.h,
                        color: AppColors.borderColor.withValues(alpha: .75),
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              AppText(
                                'Unit:',
                                style: FigmaTextStyles.headline07SemiBold,
                              ),
                              6.horizontalSpace,
                              AppText(
                                'STK',
                                style: FigmaTextStyles.headline07Medium
                                    .copyWith(color: AppColors.textGreyishDark),
                              ),
                            ],
                          ),
                          2.horizontalSpace,
                          SizedBox(
                            height: 16.h,
                            child: VerticalDivider(
                              color: AppColors.borderColor,
                              width: 20.w,
                            ),
                          ),
                          2.horizontalSpace,
                          Row(
                            children: [
                              AppText(
                                'Unit Price:',
                                style: FigmaTextStyles.headline07SemiBold,
                              ),
                              6.horizontalSpace,
                              AppText(
                                '1.234,00 kr',
                                style: FigmaTextStyles.headline07Medium
                                    .copyWith(color: AppColors.textGreyishDark),
                              ),
                            ],
                          ),

                          const Spacer(),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 9.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.editPenIcon,
                                  height: 18.h,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.textPrimary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                  child: VerticalDivider(
                                    color: AppColors.borderColor,
                                    width: 20.w,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){

                                    showModalBottomSheet(
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                                      ),
                                      backgroundColor: Colors.white,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                                            top: AppDimensions.viewHorizontalPadding + 3,
                                            left: AppDimensions.viewHorizontalPadding + 3,
                                            right: AppDimensions.viewHorizontalPadding + 3,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              8.verticalSpace,
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/wheel-side.png',
                                                    // 'assets/images/wheel-side-2.png',
                                                    height: 33.h,
                                                  ),
                                                  14.horizontalSpace,
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        AppText(
                                                          'Af-og pamontering af hjul pa bil',
                                                          maxLines: 2,
                                                          style: FigmaTextStyles.headline05SemiBold,
                                                        ),
                                                        AppText(
                                                          '@ 1905 Kr',
                                                          style: FigmaTextStyles.headline06Medium.copyWith(
                                                            fontStyle: FontStyle.italic
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                endIndent: 10.w,
                                                indent: 10.w,
                                                height: 20.h,
                                                color: AppColors.borderColor.withValues(alpha: .75),
                                                thickness: 1,
                                              ),


                                              ///------- Quantity Incrementor
                                              10.verticalSpace,

                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  AppText('Quantity',
                                                    style: FigmaTextStyles.headline06SemiBold.copyWith(
                                                        // letterSpacing: -0.4
                                                    ),
                                                  ),
                                                  8.verticalSpace,
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: AppColors.borderColor,
                                                        width: .80,
                                                      ),
                                                      borderRadius: BorderRadius.circular(6.r),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                              padding: EdgeInsets.symmetric(
                                                                vertical: 10.h,
                                                              ),
                                                              child: Icon(Icons.remove, size: 18.sp)),
                                                        ),
                                                        2.horizontalSpace,
                                                        Text('00',
                                                          style: FigmaTextStyles.headline05SemiBold.copyWith(
                                                              color: AppColors.primary
                                                          ),
                                                        ),
                                                        2.horizontalSpace,
                                                        Expanded(
                                                          child: Container(
                                                              padding: EdgeInsets.symmetric(
                                                                vertical: 10.h,
                                                              ),
                                                              child: Icon(Icons.add, size: 18.sp)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              ///------ Unit Selector
                                              16.verticalSpace,
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text('Unit',
                                                        style: FigmaTextStyles.headline06SemiBold.copyWith(
                                                            letterSpacing: -0.4
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  8.verticalSpace,
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                            alignment: Alignment.center,
                                                            padding: EdgeInsets.symmetric(
                                                              vertical: 10.h,
                                                            ),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(6.r),
                                                                color: AppColors.primary.withValues(
                                                                    alpha: .05
                                                                ),
                                                                border: Border.all(
                                                                  color: AppColors.primary,
                                                                  width: 1,
                                                                )
                                                            ),
                                                            child: Text('STK',
                                                              style: FigmaTextStyles.headline06SemiBold.copyWith(
                                                                  color: AppColors.primary
                                                              ),
                                                            )),
                                                      ),
                                                      8.horizontalSpace,
                                                      Expanded(
                                                        child: Container(
                                                            alignment: Alignment.center,
                                                            padding: EdgeInsets.symmetric(
                                                              vertical: 10.h,
                                                            ),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(6.r),
                                                                border: Border.all(
                                                                  color: AppColors.borderColor,
                                                                  width: .75,
                                                                )
                                                            ),
                                                            child: Text('Timer',
                                                              style: FigmaTextStyles.headline06SemiBold.copyWith(
                                                                  color: AppColors.textGreyishLighter
                                                              ),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),


                                              ///------ Unit Price Text Field
                                              16.verticalSpace,
                                              GlobalTextField(
                                                labelText: 'Unit Price (Kr)',
                                                hintText: '1200',
                                                  labelStyle:  FigmaTextStyles.headline06SemiBold
                                              ),
                                              ///------- Discount Text Field
                                              16.verticalSpace,
                                              GlobalTextField(
                                                labelText: 'Discount %',
                                                hintText: 'Enter in Percentage',
                                                labelStyle:  FigmaTextStyles.headline06SemiBold
                                              ),


                                              ///-------- Sheet Buttons
                                              16.verticalSpace,
                                              Row(
                                                children: [
                                                  CustomButton(text: 'Cancel',
                                                  isExpanded: true,
                                                    isOutlined: true,
                                                    onPressed: () => Navigator.pop(context),
                                                  ),
                                                  10.horizontalSpace,
                                                  CustomButton(text: 'Update & Add',
                                                    onPressed: () => Navigator.pop(context),
                                                    isExpanded: true,
                                                  ),



                                                ],
                                              )





                                            ]
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  behavior: HitTestBehavior.opaque,
                                  child: SvgPicture.asset(
                                    index == 2
                                        ? AppAssets.checkTickIcon
                                        : AppAssets.plusAddIcon,
                                    height: index == 2 ? 11.h : 18.h,
                                    colorFilter: ColorFilter.mode(
                                      index == 2
                                          ? AppColors.primary
                                          : AppColors.textGreyishLighter,
                                      BlendMode.srcIn,
                                    ),
                                  ),
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
      bottomBar: GestureDetector(
        onTap: () {
          showCupertinoModalBottomSheet(
            context: context,
            isDismissible: true,
            enableDrag: true,
            expand: true,
            builder: (context) => const ProductBottomSheet(),
          );
        },
        child: Container(
          width: double.infinity,
          height: 90.h,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w,),
          decoration: BoxDecoration(
            color: AppColors.textGreyishLightest.withValues(alpha: .4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          // alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.doubleArrowUpIcon),
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
                      onPressed: (){

                        showConfirmationBottomSheet(
                          context: context,
                          title: 'Confirm price override',
                          subtitle: 'You are about to override the actual product price (80.00 kr). Are you sure?',
                          iconPath: AppAssets.emptyWalletIcon,
                          primaryButtonText: 'Yes, Override',
                          secondaryButtonText: 'Cancel'
                        );
                      },

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}