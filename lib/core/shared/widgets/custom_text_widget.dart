import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  final String text;
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
  Widget build(BuildContext context) {
    TextStyle finalStyle = style ?? const TextStyle();

    // Apply style overrides conditionally using copyWith
    finalStyle = finalStyle.copyWith(
      fontSize: fontSize?.sp,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );

    return GestureDetector(
      onTap: (){
        HapticFeedback.lightImpact();
        if(onTap != null) {
          onTap!();
        }
      },
      child: Text(
        translatable ? _translate(text) : text,
        style: finalStyle,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }

  /// Replace this with your localization logic or `.tr()` from easy_localization/getx
  String _translate(String key) {
    // Example for getx:
    // return key.tr;

    // Example for easy_localization:
    // return key.tr();

    return key; // fallback: return the raw string
  }
}