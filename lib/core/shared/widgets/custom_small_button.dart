// app_small_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';

import '../../app_resources/app_colors.dart';

class AppSmallButton extends StatelessWidget {
  const AppSmallButton({
    super.key,
    required this.title,
    required this.onTap,
    this.iconPath,
    this.iconSize,
    this.backgroundColor,
    this.outlined = false,
  });

  /// Text shown inside the button.
  final String title;

  /// Tap callback.
  final VoidCallback onTap;

  /// Optional SVG asset path shown *before* the text.
  final String? iconPath;

  /// Optional override size for the SVG (defaults to 18).
  final double? iconSize;

  /// Override the fill colour (defaults to `AppColors.primary`).
  final Color? backgroundColor;

  /// When `true` the button becomes an outlined button
  /// (white/transparent background + border).
  final bool outlined;

  static const _radius = 9.0;

  @override
  Widget build(BuildContext context) {
    final Color primary     = backgroundColor ?? AppColors.primary;
    final Color fillColor   = outlined ? Colors.white : primary;
    final Color splashColor =
    outlined ? Colors.grey.withValues(
        alpha: .15) : Colors.white.withValues(
        alpha: .25);

    final TextStyle textStyle = FigmaTextStyles.headline07Medium.copyWith(
      color: outlined ? AppColors.textPrimary : Colors.white
    );
    // Theme.of(context)
    //     .textTheme
    //     .labelLarge!
    //     .copyWith(color: outlined ? primary : Colors.white);

    return Material(
      color: fillColor,
      elevation: 0,                       // flat
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_radius),
        side: outlined ? BorderSide(color: AppColors.borderColor) : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_radius.r),
        splashColor: splashColor,
        highlightColor: splashColor,      // “tap” colour (very light)
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 9.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconPath != null) ...[
                SvgPicture.asset(
                  iconPath!,
                  width: iconSize ?? 18.h,
                  height: iconSize ?? 18.h,
                  colorFilter: ColorFilter.mode(outlined ? AppColors.textPrimary : Colors.white, BlendMode.srcIn),
                  // color: outlined ? primary : Colors.white,
                ),
                6.horizontalSpace,
              ],
              Text(title, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}