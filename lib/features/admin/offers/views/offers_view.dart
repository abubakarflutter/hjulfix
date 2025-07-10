import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_dimens.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../dashboard/views/dashboard_view.dart';

class OffersView extends ConsumerWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
      title: "Offers",
      subtitle: "Manage sent and draft offers",
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
                          ? 'Sent (3)'
                          : index == 2
                          ? 'Archived (2)'
                          : index == 3
                          ? 'Deleted (8)'
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
                  Row(
                    children: [
                      12.horizontalSpace,

                      //---- Icon
                      Container(
                        height: 32.h,
                        width: 32.h,
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
                            Text(
                              'Quote#  2786',
                              style: FigmaTextStyles.headline06Medium.copyWith(
                                color: AppColors.textGreyishDark,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      5.horizontalSpace,
                      Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: CustomPopup(
                          barrierColor: Colors.black.withOpacity(0.3),
                          onBeforePopup: () {
                            HapticFeedback.lightImpact();
                          },
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PopUpTile(
                                title: 'Edit Offer',
                                iconPath: AppAssets.editPenIcon,
                              ),
                              PopUpTile(
                                title: 'Accept Offer & Create Job',
                                iconPath: AppAssets.checkTickIcon,
                                iconSize: 12,
                              ),
                              PopUpTile(
                                title: 'Download Offer PDF',
                                iconPath: AppAssets.downloadIcon,
                                iconSize: 16,
                              ),
                              PopUpTile(
                                title: 'Delete',
                                iconPath: AppAssets.trashIcon,
                                isDelete: true,
                              ),
                            ],
                          ),
                          // contentPadding: EdgeInsets.only(right: 10.w),
                          child: SvgPicture.asset(
                            AppAssets.ellipsisVerticalIcon,
                            height: 18.h,
                            colorFilter: ColorFilter.mode(
                              AppColors.textGreyishLighter,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    endIndent: 10.w,
                    indent: 10.w,
                    height: 28.h,
                    color: AppColors.borderColor.withValues(alpha: .75),
                    thickness: 1,
                  ),
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
                            Text(
                              '15 Dec. 2025',
                              style: FigmaTextStyles.headline06Medium.copyWith(
                                color: AppColors.textGreyishDark,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),

                        ///----- Date
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.emptyWalletIcon,
                              height: 15.sp,
                              // colorFilter: ColorFilter,
                            ),
                            5.horizontalSpace,
                            AppText(
                              '640 DKK',
                              style: FigmaTextStyles.headline07SemiBold,
                            ),
                            5.horizontalSpace,
                            AppText(
                              '(Net 8 Days)',
                              style: FigmaTextStyles.headline06Medium.copyWith(
                                color: AppColors.textGreyishDark,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
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
      floatingButton: SizedBox(
        height: 42.h,
        child: FloatingActionButton.extended(
          heroTag: 'createOfferFab', // unique when you have >1 FAB
          onPressed: () => context.pushNamed(Routes.createOfferView),
          backgroundColor: AppColors.primary,
          extendedPadding: EdgeInsets.symmetric(horizontal: 16.w),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
          label: Text(
            'Create Offer',
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

class PopUpTile extends StatelessWidget {
  final String title, iconPath;
  final bool isDelete;
  final double iconSize;
  const PopUpTile({
    super.key,
    required this.title,
    required this.iconPath,
    this.isDelete = false,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            height: iconSize.h,
            colorFilter: ColorFilter.mode(
              isDelete ? Colors.red : AppColors.textPrimary,
              BlendMode.srcIn,
            ),
          ),
          12.horizontalSpace,
          AppText(
            title,
            style: FigmaTextStyles.headline06Medium.copyWith(
              color: isDelete ? Colors.red : null,
            ),
          ),
          4.horizontalSpace,
        ],
      ),
    );
  }
}

class OfferSheetOptions extends StatelessWidget {
  final String title, iconPath;
  final bool isDelete;

  const OfferSheetOptions({
    super.key,
    required this.title,
    required this.iconPath,
    this.isDelete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: AppColors.borderColor, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 22.h,
              colorFilter: ColorFilter.mode(
                isDelete ? Colors.red : AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            8.verticalSpace,
            AppText(
              title,
              style: FigmaTextStyles.headline06SemiBold.copyWith(
                color: isDelete ? Colors.red : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
