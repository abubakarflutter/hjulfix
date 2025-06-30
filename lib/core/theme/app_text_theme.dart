import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hjulfix_new/core/utils/media_query.dart';

import '../app_resources/app_colors.dart';

class AppTextTheme {
  static const String _fontFamily = 'Montserrat';
  static const double _letterSpacing = 0;

  // Font weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w900;

  // Create TextTheme with your Figma mapping
  static TextTheme get textTheme => TextTheme(
    // Headlines (24px → 11px)
    displayLarge: TextStyle(
      // Headline-01 (24px)
      fontFamily: _fontFamily,
      fontSize: isTablet() ? 19.sp : 24.sp,
      fontWeight: regular, // Default to regular, override as needed
      color: AppColors.textPrimary,
        letterSpacing: _letterSpacing
    ),
    displayMedium: TextStyle(
      // Headline-02 (20px)
      fontFamily: _fontFamily,
      fontSize: isTablet() ? 13.sp : 19.5.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,
        letterSpacing:_letterSpacing

    ),
    displaySmall: TextStyle(
      // Headline-03 (18px)
      fontFamily: _fontFamily,
      fontSize: 18.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,
        letterSpacing: _letterSpacing

    ),
    headlineLarge: TextStyle(
      // Headline-04 (16px)
      fontFamily: _fontFamily,
      fontSize: isTablet() ? 13.sp : 16.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,
        letterSpacing:_letterSpacing

    ),
    headlineMedium: TextStyle(
      // Headline-05 (14px)
      fontFamily: _fontFamily,
      // fontSize: 14.sp,
      fontSize: isTablet() ? 9.5.sp : 13.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,
        letterSpacing: _letterSpacing

    ),
    headlineSmall: TextStyle(
      // Headline-06 (12px)
      fontFamily: _fontFamily,
      fontSize: 12.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,
        letterSpacing: _letterSpacing

    ),
    titleLarge: TextStyle(
      // Headline-07 (11px)
      fontFamily: _fontFamily,
      // fontSize: 11.75.sp,
      fontSize: isTablet() ? 8.sp : 11.5.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,
        letterSpacing: _letterSpacing

    ),

    // Paragraphs
    bodyLarge: TextStyle(
      // Paragraph-Large (12px)
      fontFamily: _fontFamily,
      fontSize: 12.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,
        letterSpacing: _letterSpacing
    ),
    bodyMedium: TextStyle(
      // Paragraph-Small (10px)
      fontFamily: _fontFamily,
      fontSize: 10.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,
        letterSpacing: _letterSpacing
    ),

    // Unused styles (set to match closest equivalent)
    // titleMedium: TextStyle(
    //   fontFamily: _fontFamily,
    //   fontSize: 14.sp,
    //   fontWeight: medium,
    //
    // ),
    // titleSmall: TextStyle(
    //   fontFamily: _fontFamily,
    //   fontSize: 12.sp,
    //   fontWeight: medium,
    // ),
    // bodySmall: TextStyle(
    //   fontFamily: _fontFamily,
    //   fontSize: 10.sp,
    //   fontWeight: regular,
    // ),
    // labelLarge: TextStyle(
    //   fontFamily: _fontFamily,
    //   fontSize: 12.sp,
    //   fontWeight: medium,
    // ),
    // labelMedium: TextStyle(
    //   fontFamily: _fontFamily,
    //   fontSize: 11.sp,
    //   fontWeight: medium,
    // ),
    // labelSmall: TextStyle(
    //   fontFamily: _fontFamily,
    //   fontSize: 10.sp,
    //   fontWeight: medium,
    // ),
  );
}

// Extension for easy access to different font weights
extension TextStyleExtensions on TextStyle {
  TextStyle get regular => copyWith(fontWeight: AppTextTheme.regular);
  TextStyle get medium => copyWith(fontWeight: AppTextTheme.medium);
  TextStyle get semiBold => copyWith(fontWeight: AppTextTheme.semiBold);
  TextStyle get bold => copyWith(fontWeight: AppTextTheme.bold);
  TextStyle get extraBold => copyWith(fontWeight: AppTextTheme.extraBold);
}