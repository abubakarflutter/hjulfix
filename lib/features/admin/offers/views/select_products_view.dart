import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hjulfix_new/core/app_resources/app_dimens.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../core/theme/app_text_styles.dart';

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
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/wheel-side.png',
                        // 'assets/images/wheel-side-2.png',
                        height: 45.h,
                      ),
                      14.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              'Af-og pamontering af hjul pa bil',
                              // 'Af-og pamontering af hjul pa bil afdsafs dsdfr r',
                              style: FigmaTextStyles.headline05Bold,
                            ),
                            AppText(
                              'abdulmuneebch01@gmail.com',
                              style: FigmaTextStyles.headline06Medium.copyWith(
                                color: AppColors.textGreyishLighter,
                              ),
                            ),
                          ],
                        ),
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
