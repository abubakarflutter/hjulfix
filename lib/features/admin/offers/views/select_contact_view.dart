import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hjulfix_new/core/app_resources/app_dimens.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../core/theme/app_text_styles.dart';

class SelectContactView extends ConsumerWidget {
  const SelectContactView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
      title: "Select Contact",
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
                    hintText: 'Search person',
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              'Lasse Fisker',
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
                      index == 1
                          ? SvgPicture.asset(
                              AppAssets.checkCircleFilledIcon,
                              height: 25.h,
                              colorFilter: ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            )
                          : SvgPicture.asset(
                              AppAssets.checkCircleIcon,
                              height: 25.h,
                              colorFilter: ColorFilter.mode(
                                AppColors.textGreyishLightest,
                                BlendMode.srcIn,
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
      floatingButton: SizedBox(
        height: 43.h,
        child: FloatingActionButton.extended(
          heroTag: 'createNewContact', // unique when you have >1 FAB
          onPressed: () => context.pushNamed(Routes.createOfferView),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
          extendedPadding: EdgeInsets.symmetric(horizontal: 16.w),
          elevation: 3,
          label: Text(
            'Create New Contact',
            style: FigmaTextStyles.headline07Medium.copyWith(
              color: Colors.white,
            ),
          ),
          icon: SvgPicture.asset(
            AppAssets.editPenIcon,
            height: 18,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
