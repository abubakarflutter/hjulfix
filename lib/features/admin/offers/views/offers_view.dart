
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_dimens.dart';
import '../../../../core/routes/route_paths.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../test_button.dart';
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
              padding: EdgeInsets.symmetric(
                vertical: 12.w,
              ),
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
                                fontSize: 11.sp
                              ),
                            ),
                          ],
                        ),
                      ),
                      5.horizontalSpace,
                      IconButton(onPressed: () async {


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
                                top: AppDimensions.viewHorizontalPadding + 6,
                                left: AppDimensions.viewHorizontalPadding + 3,
                                right: AppDimensions.viewHorizontalPadding + 3,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 14.verticalSpace,
                                  AppText('Offer Options',
                                   style: FigmaTextStyles.headline05SemiBold,
                                  ),
                                  14.verticalSpace,
                                  Row(
                                    children: [
                                      OfferSheetOptions(
                                        title: 'Accept & Create Job',
                                        iconPath: AppAssets.editPenIcon,
                                      ),
                                      8.horizontalSpace,
                                      OfferSheetOptions(
                                        title: 'Edit Offer',
                                        iconPath: AppAssets.editPenIcon,
                                      ),
                                    ],
                                  ),
                                  8.verticalSpace,
                                  Row(
                                    children: [
                                      OfferSheetOptions(
                                        title: 'Delete',
                                        iconPath: AppAssets.editPenIcon,
                                        isDelete: true,
                                      ),
                                      8.horizontalSpace,
                                      OfferSheetOptions(
                                        title: 'Download PDF',
                                        iconPath: AppAssets.editPenIcon,
                                      ),
                                    ],
                                  ),
                                  16.verticalSpace,
                                  CustomButton(
                                    text: 'Close',
                                    onPressed: () =>
                                        context.pop(),
                                    isOutlined: true,
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


                      }, icon: SvgPicture.asset(AppAssets.ellipsisVerticalIcon,
                       height: 18.h,
                       colorFilter: ColorFilter.mode(AppColors.textGreyishLighter, BlendMode.srcIn),
                      ),
                       padding: EdgeInsets.zero,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                    ),
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
                              '15 July 2025',
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
                            Text(
                              '640 DKK',
                              style: FigmaTextStyles.headline07SemiBold,
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
      floatingButton: RawMaterialButton(
        onPressed: () {
          context.push(RoutePaths.createOfferView,
          );
        },
        fillColor: AppColors.primary,
        splashColor: Colors.white24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        elevation: 1,
        // minimal elevation
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        // allow dynamic size
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.editPenIcon,
              width: 18.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            4.horizontalSpace,
            AppText(
              'Create Offer',
              style: FigmaTextStyles.headline07Medium.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
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
    this.isDelete = false
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: EdgeInsets.symmetric(
                                      vertical: 12.h,
                                    horizontal: 12.w,
                                  ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: AppColors.borderColor,
          width: 1
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SvgPicture.asset(iconPath,
             height: 22.h,
             colorFilter: ColorFilter.mode(isDelete ? Colors.red : AppColors.primary, BlendMode.srcIn),
          ),
          8.verticalSpace,
          AppText(title,
           style: FigmaTextStyles.headline06SemiBold.copyWith(
             color: isDelete ? Colors.red : null
           ),
          )
        ],
      ),
    ));
  }
}