import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hjulfix_new/core/app_resources/app_dimens.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
      title: "Dashboard",
      subtitle: "Track offers and job stats",
      actions: [
        BarActionButton(
          iconPath: AppAssets.bellIcon,
          margin: EdgeInsets.only(
            right: 14.w,
          ),
        ),
      ],
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: AppDimensions.viewHorizontalPadding,
          vertical: AppDimensions.viewHorizontalPadding,
        ),
        child: Column(
          children: [
            8.verticalSpace,


            //----- Job Overview Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jobs Overview',
                  style: FigmaTextStyles.headline06Bold,
                ),
                16.verticalSpace,
                HomeStats(
                  title: "Not Started",
                  amount: "1584.0",
                  number: "29",
                  iconBgColor: Color(0xff3B7DED),
                  iconPath: "assets/icons/not-started.svg",
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: HomeStats(
                        title: "On Going",
                        amount: "1584.0",
                        number: "17",
                        iconBgColor: Color(0xff009688),

                        iconPath: "assets/icons/on-going.svg",
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: HomeStats(
                        title: "Ready",
                        amount: "1584.0",
                        number: "24",
                        iconBgColor: Color(0xffFF7954),
                        iconPath: "assets/icons/check.svg",
                      ),
                    ),
                  ],
                ),
              ],
            ),

            18.verticalSpace,

            //----- Stats by Time Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Delivered',
                  style: FigmaTextStyles.headline06Bold,
                ),
                16.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: HomeStats(
                        title: "Daily",
                        amount: "1584.0",
                        number: "25",
                      ),
                    ),
                    10.horizontalSpace,

                    Expanded(
                      child: HomeStats(
                        title: "Weekly",
                        amount: "1584.0",
                        number: "180",
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,

                Row(
                  children: [
                    Expanded(
                      child: HomeStats(
                        title: "Monthly",
                        amount: "1584.0",
                        number: "1558",
                      ),
                    ),
                    10.horizontalSpace,

                    Expanded(
                      child: HomeStats(
                        title: "Yearly",
                        amount: "1584.0",
                        number: "7872",
                      ),
                    ),
                  ],
                ),
              ],
            ),

            18.verticalSpace,
            //----- Customer Vehicles Overview Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Customer Vehicles Offers',
                  style: FigmaTextStyles.headline06Bold,
                ),
                16.verticalSpace,
                HomeStats(
                  title: "Total",
                  number: "287",
                ),
                10.verticalSpace,

                Row(
                  children: [
                    Expanded(
                      child: HomeStats(
                        title: "Sent",
                        number: "41",
                      ),
                    ),
                    10.horizontalSpace,

                    Expanded(
                      child: HomeStats(
                        title: "Seen",
                        number: "34",
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,

                Row(
                  children: [
                    Expanded(
                      child: HomeStats(
                        title: "Accepted",
                        number: "450",
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: HomeStats(
                        title: "Rejected",
                        number: "12",
                      ),
                    ),
                  ],
                ),
              ],
            ),

            18.verticalSpace,

          ],
        ),
      ),
    );
  }
}

class BarActionButton extends StatelessWidget {
  final String iconPath;
  final EdgeInsetsGeometry margin;
  const BarActionButton({
    super.key,
    required this.iconPath,
    required this.margin
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      width: 34.h,
      margin: margin,
      padding: EdgeInsets.all(5).w,
      decoration: BoxDecoration(
        color: Colors.white.withValues(
          alpha: .2
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: SvgPicture.asset(iconPath),
    );
  }
}

class HomeStats extends StatelessWidget {
  final String title, number;
  final String? iconPath, amount;
  final Color? iconBgColor;

  const HomeStats({
    super.key,
    required this.title,
    required this.number,
     this.amount,
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
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.borderColor.withValues(
        //       alpha: .5
        //     ),
        //     blurRadius: 8,
        //     spreadRadius: 0,
        //   )
        // ],
        border: Border.all(
          color: AppColors.borderColor,
          width: 1
        )
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

          amount == null ?

          TweenAnimationBuilder<int>(
            tween: IntTween(begin: 0, end: int.parse(number)),
            duration: Duration(milliseconds: 1500),
            builder: (context, value, child) {
              return  Text(value.toString(),
                style: FigmaTextStyles.headline02Bold,
              );
            },
          )



         : iconPath  == null ?
          Row(
            children: [
              TweenAnimationBuilder<int>(
                tween: IntTween(begin: 0, end: int.parse(number)),
                duration: Duration(milliseconds: 1500),

                builder: (context, value, child) {
                  return  Text(value.toString(),
                    style: FigmaTextStyles.headline02Bold,
                  );
                },
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
                  Text(amount ?? "",
                    style: FigmaTextStyles.headline05SemiBold.copyWith(
                        color: AppColors.textGreyishLightest
                    ),
                    // style: FigmaTextStyles.headline01ExtraBold,
                  ),
                  5.horizontalSpace,
                  Text('kr',
                    style: FigmaTextStyles.headline07SemiBold.copyWith(
                        color: AppColors.textGreyishLightest
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
              TweenAnimationBuilder<int>(
                tween: IntTween(begin: 0, end: int.parse(number)),
                duration: Duration(milliseconds: 1500),
                builder: (context, value, child) {
                  return  Text(value.toString(),
                    style: FigmaTextStyles.headline02Bold,
                  );
                },
              ),
              5.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(amount ?? "",
                    style: FigmaTextStyles.headline05SemiBold.copyWith(
                        color: AppColors.textGreyishLightest
                    ),
                    // style: FigmaTextStyles.headline01ExtraBold,
                  ),
                  5.horizontalSpace,
                  Text('kr',
                    style: FigmaTextStyles.headline07SemiBold.copyWith(
                        color: AppColors.textGreyishLightest
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