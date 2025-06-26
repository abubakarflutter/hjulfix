import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hjulfix_new/core/app_resources/app_dimens.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
      title: "Dashboard",
      subtitle: "Manage and track dealer offers with ease.",
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: AppDimensions.viewHorizontalPadding,
          vertical: AppDimensions.viewHorizontalPadding,
        ),
        child: Column(
          children: [

            //----- Job Overview Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jobs Overview',
                  style: FigmaTextStyles.headline06Bold,
                ),
                12.verticalSpace,
                HomeStats(
                  title: "Not Started",
                  amount: "1584.0",
                  number: "282",
                  iconBgColor: Color(0xff3B7DED),
                  iconPath: "assets/icons/not-started.svg",
                ),
                12.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: HomeStats(
                        title: "On Going",
                        amount: "1584.0",
                        number: "282",
                        iconBgColor: Color(0xff009688),

                        iconPath: "assets/icons/on-going.svg",
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: HomeStats(
                        title: "Ready",
                        amount: "1584.0",
                        number: "282",
                        iconBgColor: Color(0xffFF7954),
                        iconPath: "assets/icons/check.svg",
                      ),
                    ),
                  ],
                ),
              ],
            ),

            20.verticalSpace,

            //----- Stats by Time Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Delivered',
                  style: FigmaTextStyles.headline06Bold,
                ),
                12.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: HomeStats(
                        title: "Daily",
                        amount: "1584.0",
                        number: "25",
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: HomeStats(
                        title: "Ready",
                        amount: "1584.0",
                        number: "282",
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: HomeStats(
                        title: "Daily",
                        amount: "1584.0",
                        number: "25",
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: HomeStats(
                        title: "Ready",
                        amount: "1584.0",
                        number: "282",
                      ),
                    ),
                  ],
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}

class HomeStats extends StatelessWidget {
  final String title, number, amount;
  final String? iconPath;
  final Color? iconBgColor;

  const HomeStats({
    super.key,
    required this.title,
    required this.number,
    required this.amount,
     this.iconPath,
     this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
               style: FigmaTextStyles.headline06SemiBold,
              ),
              if (iconPath  != null)  Container(
                height: 30.h,
                width: 30.h,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: iconBgColor
                ),
                child: SvgPicture.asset(iconPath ?? "",
                 height: 16.sp,
                 colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),

            ],
          ),
          iconPath  != null ?  5.verticalSpace : 7.verticalSpace,

          iconPath  == null ?
          Row(
            children: [
              Text(number,
                style: FigmaTextStyles.headline02Bold,
                // style: FigmaTextStyles.headline01ExtraBold,
              ),
              8.horizontalSpace,
              SizedBox(
                height: 15.h,
                child: VerticalDivider(
                  width: 0,
                  thickness: 1,
                  color: AppColors.borderColor,
                ),
              ),
              8.horizontalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(amount,
                    style: FigmaTextStyles.headline05SemiBold.copyWith(
                        color: AppColors.textGreyishLight
                    ),
                    // style: FigmaTextStyles.headline01ExtraBold,
                  ),
                  5.horizontalSpace,
                  Text('kr',
                    style: FigmaTextStyles.headline07SemiBold.copyWith(
                        color: AppColors.textGreyishLight
                    ),
                    // style: FigmaTextStyles.headline01ExtraBold,
                  ),
                ],
              ),
            ],
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(number,
                style: FigmaTextStyles.headline02Bold,
                // style: FigmaTextStyles.headline01ExtraBold,
              ),
              5.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(amount,
                    style: FigmaTextStyles.headline05SemiBold.copyWith(
                        color: AppColors.textGreyishLight
                    ),
                    // style: FigmaTextStyles.headline01ExtraBold,
                  ),
                  5.horizontalSpace,
                  Text('kr',
                    style: FigmaTextStyles.headline07SemiBold.copyWith(
                        color: AppColors.textGreyishLight
                    ),
                    // style: FigmaTextStyles.headline01ExtraBold,
                  ),
                ],
              ),
            ],
          )




        ],
      ),
    );
  }
}