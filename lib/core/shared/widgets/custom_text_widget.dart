import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../localization/language_provider.dart';
import '../../localization/translation_data.dart';
import '../../localization/translation_keys.dart';

/// ---------------------------------------------------------------------------
///  AppText — Now with *optional* RichText support
/// ---------------------------------------------------------------------------
///
/// * Keep using it exactly the same way for single‑style strings.
/// * Flip `isRichText: true` **and** provide `segments:` to mix styles in one
///   line. Each segment can be translatable or a raw string.
///
/// ```dart
/// AppText(
///   'Hello world',
///   fontWeight: FontWeight.w600,
/// );
///
/// AppText.rich(
///   segments: [
///     AppTextSegment('Hello '),
///     AppTextSegment(
///       TranslationKeys.world,
///       style: const TextStyle(color: Colors.blue),
///     ),
///   ],
/// );
/// ```
///
/// Both constructors end up in the same widget under the hood.
class AppText extends ConsumerWidget {
  // ------------------------------------------------------  single‑string API
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
  }) : isRichText = false,
       segments = null;

  // ------------------------------------------------------  rich‑text API
  const AppText.rich({
    super.key,
    required this.segments,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.onTap,
  }) : text = null,
       isRichText = true,
       translatable = true,
       style = null,
       fontSize = null,
       fontWeight = null,
       color = null,
       height = null;

  // ---------------------------------------------------------------- props ---
  final dynamic text; // String or TranslationKeys when !isRichText
  final bool translatable; // ignored when isRichText == true

  final TextStyle? style;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Function? onTap;

  final bool isRichText;
  final List<AppTextSegment>? segments; // required when isRichText == true

  // ---------------------------------------------------------------- widget ---
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseStyle = (style ?? const TextStyle()).copyWith(
      fontSize: fontSize?.sp,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );

    final child = isRichText
        ? _buildRichText(ref, baseStyle)
        : _buildPlainText(ref, baseStyle);

    return GestureDetector(
      onTap: onTap != null
          ? () {
              HapticFeedback.lightImpact();
              if (onTap != null) onTap!();
            }
          : null,
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }

  // ------------------------------------------------------------- helpers ---
  // Build the legacy single‑style <Text> widget
  Widget _buildPlainText(WidgetRef ref, TextStyle baseStyle) {
    return Text(
      _resolveText(ref, text, translatable),
      style: baseStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  // Build the mixed‑style <RichText> widget
  Widget _buildRichText(WidgetRef ref, TextStyle baseStyle) {
    assert(
      segments != null && segments!.isNotEmpty,
      'When isRichText is true you must supply at least one AppTextSegment',
    );

    final spans = segments!.map((seg) {
      final mergedStyle = baseStyle.merge(seg.style);
      return TextSpan(
        text: _resolveText(ref, seg.text, seg.translatable),
        style: mergedStyle,
      );
    }).toList();

    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      text: TextSpan(style: baseStyle, children: spans),
    );
  }

  // Resolve string / TranslationKey into localised text
  String _resolveText(WidgetRef ref, dynamic value, bool trans) {
    if (!trans) return value.toString();

    if (value is TranslationKeys) {
      final lang = ref.watch(languageProvider);
      return TranslationData.getText(lang, value);
    }
    return value.toString();
  }
}

/// One piece of a RichText line.
class AppTextSegment {
  const AppTextSegment(this.text, {this.style, this.translatable = true});

  final dynamic text; // String or TranslationKeys
  final TextStyle? style;
  final bool translatable;
}
