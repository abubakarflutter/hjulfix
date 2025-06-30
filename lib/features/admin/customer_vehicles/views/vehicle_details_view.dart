import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hjulfix_new/core/app_resources/app_dimens.dart';
import 'package:hjulfix_new/core/shared/widgets/custom_text_widget.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';

class VehicleDetailsView extends StatelessWidget {
  const VehicleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return VersatileScaffold(
      title: 'Create Offer',
      showBack: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.viewHorizontalPadding,
          vertical: AppDimensions.viewHorizontalPadding,
        ),
        child: Column(
          children: [
            //------ Wheel Images
            Container(
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

          ],
        ),
      ),
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