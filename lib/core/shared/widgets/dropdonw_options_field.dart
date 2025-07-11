import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_resources/app_assets.dart';
import '../../app_resources/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/media_query.dart';
import 'custom_text_widget.dart';

class CustomDropDownField extends StatelessWidget {
  final String labelText;
  final bool isRequired;
  final bool isFlexible; // Changed from isExpanded to isFlexible

  const CustomDropDownField({
    super.key,
    required this.labelText,
    this.isRequired = false,
    this.isFlexible = false, // Default to false for standalone usage
  });

  @override
  Widget build(BuildContext context) {
    final field = Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Added for better alignment
      children: [
        Row(
          children: [
            AppText(
                " $labelText",
                style: FigmaTextStyles.headline07SemiBold.copyWith(
                  fontSize: isTablet() ? 7.5.sp : 11.sp,
                )
            ),
            if(isRequired) AppText('*',
              style: FigmaTextStyles.headline05SemiBold.copyWith(
                color: Colors.red,
              ),
            ),
          ],
        ),
        8.verticalSpace,
        // Removed the wrapping Row and directly use the container
        Container(
          width: double.infinity, // Takes full available width
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.borderColor,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText('Select',
                  style: FigmaTextStyles.headline06Medium.copyWith(
                      color: AppColors.textGreyishLighter
                  )
              ),
              SvgPicture.asset(AppAssets.downArrowNarrowIcon,
                height: 8.h,
              ),
            ],
          ),
        ),
      ],
    );

    // Use Flexible instead of Expanded for Row usage
    return isFlexible ? Flexible(child: field) : field;
  }
}