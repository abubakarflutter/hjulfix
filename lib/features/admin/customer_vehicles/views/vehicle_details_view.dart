import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hjulfix_new/core/app_resources/app_dimens.dart';
import 'package:hjulfix_new/core/shared/widgets/custom_text_widget.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';
import 'package:hjulfix_new/test_button.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/routes/route_paths.dart';
import '../../../../core/routes/routes_arguments.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';

class VehicleDetailsView extends StatelessWidget {
  const VehicleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return VersatileScaffold(
      title: 'Create Offer',
      showBack: true,
      actions: [
        Container(
          margin: EdgeInsets.only(
            right: AppDimensions.viewHorizontalPadding,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 9.w,
            vertical: 4.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withValues(
                alpha: .2
            ),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.lock_reset,
                color: Colors.white,
                size: 16.sp,
              ),
              3.horizontalSpace,
              Text('Reset',
               style: FigmaTextStyles.headline07Medium.copyWith(
                 color: Colors.white,
               ),
              )
            ],
          ),
        )
      ],
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.viewHorizontalPadding,
          vertical: AppDimensions.viewHorizontalPadding,
        ),
        child: Column(
          children: [

            10.verticalSpace,

            Row(
              children: [
                ///----- Car Image with fade mask (no extra opacity)
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white,
                        Colors.transparent,
                      ],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcIn, // keeps image, masks to gradient
                  child: Image.asset(
                    'assets/images/f-1.png',
                    height: 65.h,
                  ),
                ),

                10.horizontalSpace,

                ///------ Text Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Number Plate',
                      style: FigmaTextStyles.headline06Medium.copyWith(
                        color: AppColors.textGreyishDark,
                      ),
                    ),
                    AppText(
                      'AB 67 8954',
                      style: FigmaTextStyles.headline05SemiBold,
                    ),
                    2.verticalSpace,
                    AppText(
                      'Dealer',
                      style: FigmaTextStyles.headline06Medium.copyWith(
                        color: AppColors.textGreyishDark,
                      ),
                    ),
                    AppText(
                      'Ahmed Nasir FAKE',
                      style: FigmaTextStyles.headline05SemiBold,
                    ),
                  ],
                ),
              ],
            ),




            20.verticalSpace,

            //------ Wheel Images
            GestureDetector(
              onTap: (){
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                  ),
                  backgroundColor: Colors.white,
                  isScrollControlled: true, // for full height
                  builder: (context) {
                    return Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                        top: AppDimensions.viewHorizontalPadding + 3,
                        // left: AppDimensions.viewHorizontalPadding + 3,
                        // right: AppDimensions.viewHorizontalPadding + 3,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WheelImagesSection(
                            title: 'Front Left Wheel',
                             length: 2,
                          ),
                          14.verticalSpace,
                          WheelImagesSection(
                            title: 'Front Right Wheel',
                            length: 2,
                          ),
                          14.verticalSpace,

                          WheelImagesSection(
                            title: 'Back Left Wheel',
                            length: 2,
                          ),
                          14.verticalSpace,

                          WheelImagesSection(
                            title: 'Back Right Wheel',
                            length: 2,
                          ),
                          16.verticalSpace,
                          CustomButton(
                            text: 'Close',
                            onPressed: () =>
                              context.pop(),
                            isOutlined: true,
                            margin: EdgeInsets.symmetric(
                              horizontal: AppDimensions.viewHorizontalPadding
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () => Navigator.pop(context),
                          //   child: Text("Close"),
                          // ),
                        ],
                      ),
                    );
                  },
                );

              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.borderColor, width: 1),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.wheelIcon,
                      colorFilter: ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    14.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'Wheel',
                            style: FigmaTextStyles.headline06Medium.copyWith(
                              color: AppColors.textGreyishDark,
                            ),
                          ),
                          AppText(
                            'Images',
                            style: FigmaTextStyles.headline05SemiBold,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      AppAssets.downArrowIcon,
                      colorFilter: ColorFilter.mode(
                        AppColors.textPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            20.verticalSpace,

            ///------- Options
            Row(
              children: [
                Expanded(child: OfferIncrements(
                  title: 'Rims',
                  suffixText: '(00/04)',
                )),
                10.horizontalSpace,
                Expanded(child: OfferIncrements(
                  title: 'Hard Damages',
                  suffixText: '(00/04)',
                )),
              ],
            ),

            20.verticalSpace,
            Row(
              children: [
                Expanded(child: OfferOptionSelectors(
                  title: 'Size',
                )),
                10.horizontalSpace,
                Expanded(child: OfferOptionSelectors(
                  title: 'Split Rim',
                )),
              ],
            ),

            20.verticalSpace,
            Row(
              children: [
                Expanded(child: OfferOptionSelectors(
                  title: 'Diamond Cut',
                )),
                10.horizontalSpace,
                Expanded(child: OfferOptionSelectors(
                  title: 'Color Match',
                )),
              ],
            ),

            30.verticalSpace,

            ///----- Price Details
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.priceDollarIcon,
                     height: 14.sp,
                    ),
                    6.horizontalSpace,
                    AppText('Price Details',
                      style: FigmaTextStyles.headline07SemiBold
                    )
                  ],
                ),
                10.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1x lakering of 10’’-19’’ faelg',
                           style: FigmaTextStyles.headline07Medium.copyWith(
                             color: AppColors.textGreyishDark
                           ),
                          ),
                          Text('1200 kr',
                            style: FigmaTextStyles.headline07SemiBold
                          )
                        ],
                      ),
                      2.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1x lakering of 10’’-19’’ faelg',
                           style: FigmaTextStyles.headline07Medium.copyWith(
                             color: AppColors.textGreyishDark
                           ),
                          ),
                          Text('1200 kr',
                            style: FigmaTextStyles.headline07SemiBold
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            ///----- Customer Products
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.priceDollarIcon,
                      height: 14.sp,
                    ),
                    6.horizontalSpace,
                    AppText('Custom Products',
                        style: FigmaTextStyles.headline07SemiBold
                    )
                  ],
                ),
                10.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 8.h
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.borderColor,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1x lakering of 10’’-19’’ faelg',
                            style: FigmaTextStyles.headline07Medium.copyWith(
                                color: AppColors.textGreyishDark
                            ),
                          ),
                          Row(
                            children: [
                              Text('1200 kr',
                                  style: FigmaTextStyles.headline07SemiBold
                              ),
                              6.horizontalSpace,
                              GestureDetector(
                                onTap: (){
                                  HapticFeedback.lightImpact();
                                },
                                child: SvgPicture.asset(AppAssets.deleteTagIcon,
                                 height: 22.h,
                                 colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                                )
                                // Icon(
                                //   Icons.delete_outline_rounded,
                                //   color: Colors.red,
                                //   size: 18.sp,
                                // ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            20.verticalSpace,



          ],
        ),
      ),
      bottomBar: Container(
        height: 150.h,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          left: AppDimensions.viewHorizontalPadding,
          right: AppDimensions.viewHorizontalPadding,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(
                  alpha: 0.075),
              blurRadius: 10,
              offset:
              Offset(0, -5), // Negative y-offset for upper shadow
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
                Expanded(child: AppText('Sub total',
                  style: FigmaTextStyles.headline07SemiBold.copyWith(
                      color: AppColors.textGreyishLightest
                  ),
                )),
                Expanded(child: AppText('18,500 Kr',
                  style: FigmaTextStyles.headline07SemiBold.copyWith(
                      color: AppColors.textGreyishLightest
                  ),
                  textAlign: TextAlign.end,
                )),
              ],
            ),
            4.verticalSpace,
            Row(
              children: [
                Expanded(child: AppText('VAT (25.00%)',
                  style: FigmaTextStyles.headline07SemiBold.copyWith(
                      color: AppColors.textGreyishLightest
                  ),
                )),
                Expanded(child: AppText('2,500 Kr',
                  style: FigmaTextStyles.headline07SemiBold.copyWith(
                      color: AppColors.textGreyishLightest
                  ),
                  textAlign: TextAlign.end,
                )),
              ],
            ),
            4.verticalSpace,
            Row(
              children: [
                Expanded(child: AppText('Total',
                 style: FigmaTextStyles.headline05Bold.copyWith(
                   color: AppColors.primary
                 ),
                )),
                Expanded(child: AppText('22,500 Kr',
                  style: FigmaTextStyles.headline05Bold.copyWith(
                      color: AppColors.primary
                  ),
                 textAlign: TextAlign.end,
                )),
              ],
            ),
            12.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(text: 'Add Custom Product',
                  isOutlined: true,
                    onPressed: (){
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                          ),
                          backgroundColor: Colors.white,
                          isScrollControlled: true, // for full height
                          builder: (context) {
                            return Container(
                              width: double.maxFinite,
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
                                  14.verticalSpace,
                                  Container(
                                    padding: EdgeInsets.all(6.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.borderColor,
                                        width: .75,
                                      ),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: SvgPicture.asset(AppAssets.addProductBoxIcon,
                                     height: 21.h,
                                     colorFilter: ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                                    ),
                                  ),
                                  14.verticalSpace,
                                  AppText('Add Custom Product Line',
                                   style: FigmaTextStyles.headline05SemiBold,
                                  ),
                                  14.verticalSpace,
                                  GlobalTextField(
                                    labelText: 'Name',
                                    hintText: 'Enter Product Name',
                                    labelStyle: FigmaTextStyles.headline06SemiBold,
                                  ),
                                  14.verticalSpace,
                                  GlobalTextField(
                                    labelText: 'Price',
                                    hintText: 'Enter Product Price',
                                    labelStyle: FigmaTextStyles.headline06SemiBold,
                                  ),
                                  18.verticalSpace,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(text: 'Cancel',
                                          isOutlined: true,
                                          onPressed: () => context.pop(),
                                        ),
                                      ),
                                      10.horizontalSpace,
                                      Expanded(child: CustomButton(text: 'Add'))
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );

                    },
                  ),
                ),
                10.horizontalSpace,
                Expanded(child: CustomButton(text: 'Send Offer'))
              ],
            )

          ],
        ),
      ),
    );
  }
}

class WheelImagesSection extends StatelessWidget {
  final String title;
  final int length;

  const WheelImagesSection({
    super.key,
    required this.title,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.viewHorizontalPadding + 3,
          ),
          child: Row(
            children: [
              AppText(title,
                style: FigmaTextStyles.headline07Medium.copyWith(
                    color: AppColors.textGreyishLighter
                ),
              ),
              5.horizontalSpace,
              AppText('($length attached)',
                style: FigmaTextStyles.paragraphSmallMedium.copyWith(
                    // color: AppColors.textGreyishLighter
                ),
              ),
            ],
          ),
        ),
        12.verticalSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Row(
              children: List.generate(length, (index) {
                return GestureDetector(
                  onTap: (){
                    HapticFeedback.lightImpact();
                    context.push(RoutePaths.imageViewer,
                    extra: ImageViewerArgs(
                      imageUrl: 'assets/images/wheel-image.jpg',
                      isNetworkImage: false
                    )
                    );
                  },
                  child: Container(
                    height: 75.h,
                    width: 75.h,
                    margin: EdgeInsets.only(
                      right: index != (length - 1) ? 8.w : 0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset('assets/images/wheel-image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              })
          ),
        ),
      ],
    );
  }
}

class OfferOptionSelectors extends StatelessWidget {
  final String title;

  const OfferOptionSelectors({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title,
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
                      alpha: .1
                    ),
                    border: Border.all(
                      color: AppColors.primary,
                      width: 1.5,
                    )
                  ),
                  child: Text('Yes',
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
                  child: Text('No',
                    style: FigmaTextStyles.headline06SemiBold.copyWith(
                      color: AppColors.textGreyishLighter
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}

class OfferIncrements extends StatelessWidget {
  final String title, suffixText;

  const OfferIncrements({
    super.key,
    required this.title,
    required this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title,
             style: FigmaTextStyles.headline06SemiBold.copyWith(
               letterSpacing: -0.4
             ),
             ),
            3.5.horizontalSpace,
            Text(suffixText,
              style: FigmaTextStyles.paragraphSmallMedium,
            ),
          ],
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
    );
  }
}