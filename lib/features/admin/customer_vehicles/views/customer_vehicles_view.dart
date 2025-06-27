import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hjulfix_new/core/app_resources/app_assets.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';
import 'package:hjulfix_new/test_button.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_dimens.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';
import '../../../../core/shared/widgets/custom_small_button.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
import '../../dashboard/views/dashboard_view.dart';

class CustomerVehiclesView extends ConsumerWidget {
  const CustomerVehiclesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
      title: "Customer Vehicles",
      subtitle: "View and assess dealer vehicles",
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
                      index == 0 ? 'All (8)' : index ==1 ? 'No Offer (3)' : index == 2 ? 'Created Offers (2)' : index == 3 ? 'Accepted Offers (8)' : 'Cancelled (3)',
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
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: AppDimensions.viewHorizontalPadding,
          vertical: AppDimensions.viewHorizontalPadding,
        ),
        child: Column(
          children: List.generate(8, (index) {
            return Container(
              padding: EdgeInsets.all(
                12
              ).w,
              margin: EdgeInsets.only(
                bottom: 12.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: AppColors.borderColorLight,
                  width: 1,
                )
              ),
              child: Column(
                children: [


                  Row(
                    children: [

                      //---- Icon
                      Container(
                        height: 32.h,
                        width: 32.h,
                        padding: EdgeInsets.all(5).w,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(
                            alpha: .1
                          ),
                          border: Border.all(
                            color: AppColors.primary,
                            width: 1.sp,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: SvgPicture.asset(AppAssets.carSideFaceIcon),
                      ),

                      14.horizontalSpace,

                      //----- Content Column
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('ZX 10 8765',
                         style: FigmaTextStyles.headline05Bold,
                         ),
                        Text('Abubakar',
                          style: FigmaTextStyles.headline06Medium.copyWith(
                            color: AppColors.textGreyishDark
                          ),
                        ),
                      ],)),
                      10.horizontalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: (index == 1 ? Colors.red : Color(0xff2563EB)).withValues(
                            alpha: .1,
                          ),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                           index == 1 ?
                           AppAssets.clockIcon
                            : AppAssets.sendPlaneIcon,
                              height: 15.sp,
                            ),
                            5.horizontalSpace,
                            Text(
                              index == 1 ? 'No Offer Yet' : 'Offer Created',
                             style: FigmaTextStyles.paragraphSmallSemiBold.copyWith(
                               color:  index == 1 ? Colors.red : Color(0xff2563EB),
                             ),
                            ),
                          ],
                        ),
                      )


                    ],
                  ),
                  Divider(
                    endIndent: 10.w,
                    indent: 10.w,
                    height: 28.h,
                    color: AppColors.borderColorLight,
                    thickness: 1,
                  ),

                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.calendarIcon,
                        height: 15.sp,
                      ),
                      5.horizontalSpace,
                      Text('20 July 2025',
                       style: FigmaTextStyles.paragraphSmallMedium.copyWith(
                         color: AppColors.textGreyishDark
                       ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  //- Button
                  // CustomButton(text: 'Create Offer'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: index == 1 ?
                    AppSmallButton(
                      title: "Create Offer",
                      onTap: (){},
                      iconPath: AppAssets.editPenIcon,
                    ) :
                    AppSmallButton(
                      title: "View Details",
                      onTap: (){},
                      iconPath: AppAssets.eyeOpenIcon,
                      outlined: true,
                      iconSize: 16,
                    )
                    ,
                  ),

                ],
              ),
            );
          })
        ),
      ),
    );
  }
}