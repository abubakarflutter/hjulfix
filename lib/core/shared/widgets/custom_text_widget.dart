import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../localization/language_provider.dart';
import '../../localization/translation_data.dart';
import '../../localization/translation_keys.dart';

class AppText extends ConsumerWidget {
  // Accept both String and TranslationKeys
  final dynamic text; // Can be String or TranslationKeys
  final bool translatable;
  final TextStyle? style;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Function? onTap;

  const AppText(
    this.text, {
    super.key,
    this.translatable = true,
    this.style,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.height,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle finalStyle = style ?? const TextStyle();

    // Apply style overrides conditionally using copyWith
    finalStyle = finalStyle.copyWith(
      fontSize: fontSize?.sp,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        if (onTap != null) {
          onTap!();
        }
      },
      child: Text(
        _getDisplayText(ref),
        style: finalStyle,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }

  String _getDisplayText(WidgetRef ref) {
    if (!translatable) {
      // If not translatable, return as string regardless of type
      return text.toString();
    }

    if (text is TranslationKeys) {
      // FIXED: Use ref.watch() to listen to language changes and get translation directly
      final currentLanguage = ref.watch(languageProvider);
      return TranslationData.getText(currentLanguage, text as TranslationKeys);
    } else if (text is String) {
      // If it's a string, return as is (for backward compatibility)
      return text as String;
    } else {
      // Fallback
      return text.toString();
    }
  }
}