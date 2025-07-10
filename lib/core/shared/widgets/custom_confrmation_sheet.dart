import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';
import '../../../test_button.dart';
import '../../app_resources/app_colors.dart';
import '../../app_resources/app_dimens.dart';
import 'custom_text_widget.dart';

Future<void> showConfirmationBottomSheet({
  required BuildContext context,
  required String title,
  required String subtitle,
  String? iconPath,
  double? iconHeight,
  String? primaryButtonText,
  VoidCallback? onPrimaryPressed,
  String? secondaryButtonText,
  VoidCallback? onSecondaryPressed,
  bool showPrimaryButton = true,
  bool showSecondaryButton = true,
}) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          top: AppDimensions.viewHorizontalPadding + 3,
          left: AppDimensions.viewHorizontalPadding + 3,
          right: AppDimensions.viewHorizontalPadding + 3,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (iconPath != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: SvgPicture.asset(
                  iconPath,
                  height: iconHeight ?? 19.h,
                  colorFilter:
                  const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                ),
              ),
            if (iconPath != null) 14.verticalSpace,
            AppText(title, style: FigmaTextStyles.headline05SemiBold),
            10.verticalSpace,
            AppText(
              subtitle,
              style: FigmaTextStyles.headline06Medium.copyWith(
                color: AppColors.textGreyishLighter,
              ),
            ),
            20.verticalSpace,
            if (showPrimaryButton && showSecondaryButton)
              Row(
                children: [
                  if (secondaryButtonText != null)
                    CustomButton(
                      text: secondaryButtonText,
                      onPressed: onSecondaryPressed,
                      isOutlined: true,
                      isExpanded: true,
                    ),
                  if (secondaryButtonText != null) 12.horizontalSpace,
                  if (primaryButtonText != null)
                    CustomButton(
                      text: primaryButtonText,
                      onPressed: onPrimaryPressed,
                      isExpanded: true,
                    ),
                ],
              )
            else if (showPrimaryButton && primaryButtonText != null)
              CustomButton(
                text: primaryButtonText,
                onPressed: onPrimaryPressed,
                isExpanded: true,
              )
            else if (showSecondaryButton && secondaryButtonText != null)
                CustomButton(
                  text: secondaryButtonText,
                  onPressed: onSecondaryPressed,
                  isOutlined: true,
                  isExpanded: true,
                ),
          ],
        ),
      );
    },
  );
}