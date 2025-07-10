import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_dimens.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../dashboard/views/dashboard_view.dart';

class JobsView extends ConsumerWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
      title: "Jobs",
      subtitle: "Track active and past jobs",
      actions: [
        BarActionButton(
          iconPath: AppAssets.filterIcon,
          margin: EdgeInsets.only(right: 14.w),
        ),
      ],
      flexibleHeight: 160.h,
      flexibleContent: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 10,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: Row(
                children: [
                  Expanded(
                    child: GlobalTextField(
                      hintText: 'Search by number plate',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 14.w,
                      ),
                      prefixWidget: Padding(
                        padding: EdgeInsets.only(
                          left: 14.w,
                          // right: 8.w,
                        ),
                        child: SvgPicture.asset(AppAssets.searchIcon),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            12.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: Row(
                children: List.generate(5, (index) {
                  return Container(
                    margin: EdgeInsets.only(right: 9.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: index == 0
                          ? Colors.white
                          : Colors.white.withValues(alpha: .175),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      index == 0
                          ? 'Draft (8)'
                          : index == 1
                          ? 'Coming Soon (3)'
                          : index == 2
                          ? 'On-Going (2)'
                          : index == 3
                          ? 'Not Started (8)'
                          : 'Cancelled (3)',
                      style: FigmaTextStyles.headline07Medium.copyWith(
                        fontSize: 11.sp,
                        color: index == 0
                            ? AppColors.textPrimary
                            : Colors.white,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.viewHorizontalPadding,
          vertical: AppDimensions.viewHorizontalPadding,
        ),
        child: Column(
          children: List.generate(8, (index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 12.w),
              margin: EdgeInsets.only(bottom: 13.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.borderColor, width: 1),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///----- Quote Number
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.calendarIcon,
                              height: 15.sp,
                            ),
                            5.horizontalSpace,
                            AppText(
                              '15 Dec. 2025',
                              style: FigmaTextStyles.headline06Medium.copyWith(
                                color: AppColors.textGreyishDark,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),

                        ///----- Status
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: AppText(
                            'Coming Soon',
                            style: FigmaTextStyles.headline07Medium.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  14.verticalSpace,
                  Row(
                    children: [
                      12.horizontalSpace,

                      //---- Icon
                      Container(
                        height: 33.h,
                        width: 33.h,
                        padding: EdgeInsets.all(5).w,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.userIcon,
                          colorFilter: ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),

                      10.horizontalSpace,

                      //----- Content Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              'Umar Fake',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FigmaTextStyles.headline05Bold,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Quote#  2786',
                                  style: FigmaTextStyles.headline06Medium
                                      .copyWith(
                                        color: AppColors.textGreyishDark,
                                        fontSize: 11.sp,
                                      ),
                                ),
                                8.horizontalSpace,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 3.h,
                                    horizontal: 9.w,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.borderColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                  child: AppText.rich(
                                    segments: [
                                      AppTextSegment(
                                        'Duration:',
                                        style:
                                            FigmaTextStyles.headline06SemiBold,
                                      ),
                                      AppTextSegment(
                                        '  '
                                        '7 Days',
                                        style: FigmaTextStyles.headline06Medium
                                            .copyWith(
                                              color: AppColors.textGreyishDark,
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
                    ],
                  ),
                  Divider(
                    endIndent: 10.w,
                    indent: 10.w,
                    height: 32.h,
                    color: AppColors.borderColor.withValues(alpha: .75),
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///----- Date
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.emptyWalletIcon,
                              height: 15.sp,
                              // colorFilter: ColorFilter,
                            ),
                            6.horizontalSpace,
                            AppText(
                              '6140 Kr',
                              style: FigmaTextStyles.headline07SemiBold,
                            ),
                          ],
                        ),

                        16.horizontalSpace,
                        SizedBox(
                          height: 16.h,
                          child: VerticalDivider(
                            color: AppColors.borderColor,
                            width: 24.w,
                          ),
                        ),

                        //---- Remaining
                        Row(
                          children: [
                            AppText(
                              'Remaining:',
                              style: FigmaTextStyles.headline07SemiBold,
                            ),
                            6.horizontalSpace,
                            AppText(
                              '0',
                              style: FigmaTextStyles.headline07Medium.copyWith(
                                color: AppColors.textGreyishDark,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: SvgPicture.asset(
                            AppAssets.arrowRightIcon,
                            colorFilter: ColorFilter.mode(
                              AppColors.textPrimary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
