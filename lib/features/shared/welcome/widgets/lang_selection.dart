import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hjulfix_new/core/shared/widgets/custom_text_widget.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/localization/language_model.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/media_query.dart';

class LanguageSelectionCard extends ConsumerWidget {
  final Language language;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageSelectionCard({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet() ? 12.w : 16.w,
          vertical: isTablet() ? 10.h : 14.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderColor,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(language.flagAsset, height: isTablet() ? 19.sp : 28.sp),
            14.verticalSpace,
            const Divider(
              color: AppColors.borderColor,
              height: 0,
              thickness: 0.75,
            ),
            16.verticalSpace,
            AppText(
              language.nativeName,
              style: FigmaTextStyles.headline05Bold.copyWith(
                color: isSelected ? AppColors.primary : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
