import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hjulfix_new/core/app_resources/app_assets.dart';
import 'package:hjulfix_new/core/app_resources/app_colors.dart';
import 'package:hjulfix_new/core/shared/widgets/custom_text_widget.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';

import '../../../../core/shared/widgets/base_scaffold.dart';

class MoreViewPage extends ConsumerWidget {
  const MoreViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
      title: "More",
      subtitle: "Settings, scanner, and tools",

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          18.verticalSpace,

          MoreOptionsRow(
            firstIconPath: AppAssets.navOffersOutlineIcon,
            firstLabel: 'Offers',
            firstIconSize: 19,
            firstIconColor: Color(0xff7851C1),
            firstOnTap: () {},
            secondIconPath: AppAssets.navVehicleOutlineIcon,
            secondLabel: 'Customer Vehicles',
            secondIconSize: 25,
            secondIconColor: Color(0xff008FCC),
            secondOnTap: () {},
          ),

          MoreOptionsRow(
            firstIconPath: AppAssets.growArrowIcon,
            firstLabel: 'Leads',
            firstIconSize: 13,
            firstOnTap: () {},
            secondIconPath: AppAssets.dealersUserIcon,
            secondLabel: 'Dealers',
            secondOnTap: () {},
          ),

          MoreOptionsRow(
            firstIconPath: AppAssets.userIcon,
            firstLabel: 'Admins',
            firstIconColor: Color(0xffFF7954),
            firstIconSize: 21,
            firstOnTap: () {},
            secondIconPath: AppAssets.bellIcon,
            secondIconColor: Colors.purple,
            secondLabel: 'Pickup Request',
            secondOnTap: () {},
          ),

          MoreOptionsRow(
            firstIconPath: AppAssets.workersGroupIcon,
            firstLabel: 'Workers',
            firstIconSize: 23,
            firstIconColor: Colors.blue,
            firstOnTap: () {},
            secondIconPath: AppAssets.productsIcon,
            secondLabel: 'Products',
            secondIconSize: 19,
            secondOnTap: () {},
          ),

          MoreOptionsRow(
            firstIconPath: AppAssets.stagesLayersIcon,
            firstLabel: 'Stages',
            firstIconSize: 17,
            firstOnTap: () {},
            secondIconPath: AppAssets.clockIcon,
            secondLabel: 'Stage Transaction',
            secondOnTap: () {},
          ),

          Padding(
            padding: EdgeInsets.only(left: 17.w, bottom: 15.h, top: 4.h),
            child: AppText(
              'Other features',
              style: FigmaTextStyles.headline06SemiBold,
            ),
          ),

          MoreOptionsRow(
            firstIconPath: AppAssets.languageIcon,
            firstLabel: 'Languages',
            firstIconSize: 22,
            // firstIconColor: Colors.green,
            firstOnTap: () {},
            secondIconPath: AppAssets.settingsIcon,
            secondLabel: 'Settings',
            secondOnTap: () {},
          ),

          //----- Logout
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppAssets.logoutIcon),
                14.horizontalSpace,
                AppText('Logout', style: FigmaTextStyles.headline06SemiBold),
              ],
            ),
          ),

          30.verticalSpace,
        ],
      ),
    );
  }
}

class MoreOptionsRow extends StatelessWidget {
  final String firstIconPath, secondIconPath, firstLabel, secondLabel;
  final double firstIconSize, secondIconSize;
  final Color? firstIconColor, secondIconColor;
  final Function firstOnTap, secondOnTap;

  const MoreOptionsRow({
    super.key,
    required this.firstIconPath,
    required this.secondIconPath,
    required this.firstLabel,
    required this.secondLabel,
    required this.firstOnTap,
    required this.secondOnTap,
    this.firstIconSize = 20,
    this.secondIconSize = 20,
    this.firstIconColor,
    this.secondIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 12.h),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => firstOnTap,
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: 85.h,
                padding: EdgeInsets.all(12).w,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      firstIconPath,
                      height: firstIconSize.h,
                      colorFilter: firstIconColor != null
                          ? ColorFilter.mode(firstIconColor!, BlendMode.srcIn)
                          : null,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          firstLabel,
                          style: FigmaTextStyles.headline06SemiBold,
                        ),
                        SvgPicture.asset(AppAssets.arrowRightIcon),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: GestureDetector(
              onTap: () => secondOnTap,
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: 85.h,
                padding: EdgeInsets.all(12).w,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      secondIconPath,
                      height: secondIconSize.h,
                      colorFilter: secondIconColor != null
                          ? ColorFilter.mode(secondIconColor!, BlendMode.srcIn)
                          : null,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          secondLabel,
                          style: FigmaTextStyles.headline06SemiBold,
                        ),
                        SvgPicture.asset(AppAssets.arrowRightIcon),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
