import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_resources/app_colors.dart';

class AppTextTheme {
  static const String _fontFamily = 'Montserrat';

  // Font weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Create TextTheme with your Figma mapping
  static TextTheme get textTheme =>  TextTheme(
    // Headlines (24px → 11px)
    displayLarge: TextStyle(     // Headline-01 (24px)
      fontFamily: _fontFamily,
      fontSize: 24.sp,
      fontWeight: regular,       // Default to regular, override as needed
      color: AppColors.textPrimary,
    ),
    displayMedium: TextStyle(    // Headline-02 (20px)
      fontFamily: _fontFamily,
      fontSize: 19.5.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,

    ),
    displaySmall: TextStyle(     // Headline-03 (18px)
      fontFamily: _fontFamily,
      fontSize: 18.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,

    ),
    headlineLarge: TextStyle(    // Headline-04 (16px)
      fontFamily: _fontFamily,
      fontSize: 16.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,

    ),
    headlineMedium: TextStyle(   // Headline-05 (14px)
      fontFamily: _fontFamily,
      fontSize: 14.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,

    ),
    headlineSmall: TextStyle(    // Headline-06 (12px)
      fontFamily: _fontFamily,
      fontSize: 12.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,
    ),
    titleLarge: TextStyle(       // Headline-07 (11px)
      fontFamily: _fontFamily,
      fontSize: 11.75.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,
    ),

    // Paragraphs
    bodyLarge: TextStyle(        // Paragraph-Large (12px)
      fontFamily: _fontFamily,
      fontSize: 12.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,

    ),
    bodyMedium: TextStyle(       // Paragraph-Small (10px)
      fontFamily: _fontFamily,
      fontSize: 10.sp,
      fontWeight: regular,
      color: AppColors.textPrimary,

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
}