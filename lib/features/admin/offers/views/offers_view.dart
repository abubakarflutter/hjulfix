import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
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
            margin: EdgeInsets.only(
              right: 14.w,
            ),
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
                padding: EdgeInsets.only(
                  left: 14.w,
                  right: 14.w,
                ),
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
                          padding:  EdgeInsets.only(
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
                padding: EdgeInsets.only(
                  left: 14.w,
                  right: 14.w,
                ),
                child: Row(
                  children: List.generate(5, (index) {
                    return Container(
                      margin: EdgeInsets.only(
                        right: 9.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: index == 0 ? Colors.white : Colors.white.withValues(
                            alpha: .175
                        ),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Text(
                        index == 0 ? 'Draft (8)' : index ==1 ? 'Sent (3)' : index == 2 ? 'Archived (2)' : index == 3 ? 'Deleted (8)' : 'Cancelled (3)',
                        style: FigmaTextStyles.headline07Medium.copyWith(
                          fontSize: 11.sp,
                          color: index == 0 ? AppColors.textPrimary : Colors.white,
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [

          ],
        ),
      floatingButton: RawMaterialButton(
        onPressed: () {},
        fillColor: AppColors.primary,
        splashColor: Colors.white24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        elevation: 1, // minimal elevation
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        constraints: const BoxConstraints(minWidth: 0, minHeight: 0), // allow dynamic size
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.editPenIcon,
              width: 18.h,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            4.horizontalSpace,
            AppText(
              'Create Offer',
              style: FigmaTextStyles.headline07Medium.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),

    );
  }
}