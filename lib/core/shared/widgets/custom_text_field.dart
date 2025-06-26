import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hjulfix_new/core/utils/media_query.dart';
import 'package:hjulfix_new/core/utils/system_utils.dart';

import '../../app_resources/app_colors.dart';
import '../../theme/app_text_styles.dart';

class GlobalTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool isObscure;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? contentPadding;
  final List<String>? autofillHints; // New parameter for autofill

  const GlobalTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.isObscure = false,
    this.suffixWidget,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.maxLines = 1,
    this.textStyle,
    this.labelStyle,
    this.contentPadding,
    this.autofillHints, // Add autofill hints parameter
  });

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label text (only show if provided)
        if (widget.labelText != null) ...[
          Text(
            " ${widget.labelText!}",
            style:
                widget.labelStyle ??
                FigmaTextStyles.headline07Medium.copyWith(
                  color: AppColors.textGreyishDark,
                  fontSize: isTablet() ? 7.5.sp : 11.sp,
                ),
            // TextStyle(
            //   fontSize: 11.5.sp,
            //     fontFamily: AppConfigs.appFontFamily,
            //   fontWeight: FontWeight.w500,
            //   color: AppColors.textSecondaryGreyish
            // ),
          ),
          8.verticalSpace,
        ],

        // Text field
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: widget.isObscure,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          validator: widget.validator,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          autofillHints: widget.autofillHints, // Add autofill hints
          style:
              widget.textStyle ??
              FigmaTextStyles.headline07Medium.copyWith(
                // color: AppColors.textSecondaryGreyish,
                fontSize: isTablet() ? 8.5.sp : 12.sp,
              ),
          // TextStyle(
          //   fontSize: 12.sp,
          //   fontFamily: AppConfigs.appFontFamily,
          //   fontWeight: FontWeight.w500,
          //   color: AppColors.textPrimary,
          // ),
          onTapOutside: (PointerDownEvent event) {
            // Dismiss keyboard and unfocus when tapping outside
            // FocusScope.of(context).unfocus();
            SystemMethods.dismissKeyboard();
          },
          cursorColor: AppColors.textPrimary,
          cursorHeight: isTablet() ? 14.h : 16.h,
          cursorWidth: 1.75.w,
          decoration: InputDecoration(
            // hintText: widget.hintText,
            // hintStyle: const TextStyle(fontSize: 16, color: Color(0xFF999999)),
            suffixIcon: widget.suffixWidget,
            contentPadding:
                widget.contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: isTablet() ? 10.w : 16.w,
                  vertical: isTablet() ? 10.h : 14.h,
                ),

            // Border styling
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.r),
              borderSide: const BorderSide(
                color: Color(0xFFDDDDDD),
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.r),

              borderSide: const BorderSide(
                color: Color(0xFFDDDDDD),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.r),

              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.25,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.r),

              borderSide: const BorderSide(color: Colors.red, width: 1.25),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.r),

              borderSide: const BorderSide(color: Colors.red, width: 1.25),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.r),
              borderSide: const BorderSide(
                color: Color(0xFFE0E0E0),
                width: 1.0,
              ),
            ),

            // Remove default background color
            filled: true,
            isDense: true,
            fillColor: widget.enabled ? Colors.white : const Color(0xFFF5F5F5),
          ),
        ),
      ],
    );
  }
}