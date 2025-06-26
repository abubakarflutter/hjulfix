// Helper class with descriptive names matching your Figma file
import 'package:flutter/material.dart';

import 'app_text_theme.dart';

class FigmaTextStyles {
  static TextTheme get theme => AppTextTheme.textTheme;

  // Headline styles with all variants
  static TextStyle get headline01Regular => theme.displayLarge!.regular;
  static TextStyle get headline01Medium => theme.displayLarge!.medium;
  static TextStyle get headline01SemiBold => theme.displayLarge!.semiBold;
  static TextStyle get headline01Bold => theme.displayLarge!.bold;
  static TextStyle get headline01ExtraBold => theme.displayLarge!.extraBold;

  static TextStyle get headline02Regular => theme.displayMedium!.regular;
  static TextStyle get headline02Medium => theme.displayMedium!.medium;
  static TextStyle get headline02SemiBold => theme.displayMedium!.semiBold;
  static TextStyle get headline02Bold => theme.displayMedium!.bold;
  static TextStyle get headline02ExtraBold => theme.displayMedium!.extraBold;

  static TextStyle get headline03Regular => theme.displaySmall!.regular;
  static TextStyle get headline03Medium => theme.displaySmall!.medium;
  static TextStyle get headline03SemiBold => theme.displaySmall!.semiBold;
  static TextStyle get headline03Bold => theme.displaySmall!.bold;
  static TextStyle get headline03ExtraBold => theme.displaySmall!.extraBold;

  static TextStyle get headline04Regular => theme.headlineLarge!.regular;
  static TextStyle get headline04Medium => theme.headlineLarge!.medium;
  static TextStyle get headline04SemiBold => theme.headlineLarge!.semiBold;
  static TextStyle get headline04Bold => theme.headlineLarge!.bold;
  static TextStyle get headline04ExtraBold => theme.headlineLarge!.extraBold;

  static TextStyle get headline05Regular => theme.headlineMedium!.regular;
  static TextStyle get headline05Medium => theme.headlineMedium!.medium;
  static TextStyle get headline05SemiBold => theme.headlineMedium!.semiBold;
  static TextStyle get headline05Bold => theme.headlineMedium!.bold;
  static TextStyle get headline05ExtraBold => theme.headlineMedium!.extraBold;

  static TextStyle get headline06Regular => theme.headlineSmall!.regular;
  static TextStyle get headline06Medium => theme.headlineSmall!.medium;
  static TextStyle get headline06SemiBold => theme.headlineSmall!.semiBold;
  static TextStyle get headline06Bold => theme.headlineSmall!.bold;
  static TextStyle get headline06ExtraBold => theme.headlineSmall!.extraBold;

  static TextStyle get headline07Regular => theme.titleLarge!.regular;
  static TextStyle get headline07Medium => theme.titleLarge!.medium;
  static TextStyle get headline07SemiBold => theme.titleLarge!.semiBold;
  static TextStyle get headline07Bold => theme.titleLarge!.bold;
  static TextStyle get headline07ExtraBold => theme.titleLarge!.extraBold;

  // Paragraph styles with all variants
  static TextStyle get paragraphLargeRegular => theme.bodyLarge!.regular;
  static TextStyle get paragraphLargeMedium => theme.bodyLarge!.medium;
  static TextStyle get paragraphLargeSemiBold => theme.bodyLarge!.semiBold;
  static TextStyle get paragraphLargeBold => theme.bodyLarge!.bold;
  static TextStyle get paragraphLargeExtraBold => theme.bodyLarge!.extraBold;

  static TextStyle get paragraphSmallRegular => theme.bodyMedium!.regular;
  static TextStyle get paragraphSmallMedium => theme.bodyMedium!.medium;
  static TextStyle get paragraphSmallSemiBold => theme.bodyMedium!.semiBold;
  static TextStyle get paragraphSmallBold => theme.bodyMedium!.bold;
  static TextStyle get paragraphSmallExtraBold => theme.bodyMedium!.extraBold;
}