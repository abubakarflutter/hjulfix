import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hjulfix_new/core/utils/media_query.dart';
import 'package:hjulfix_new/core/utils/system_utils.dart';

import '../../app_resources/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'custom_text_widget.dart';

class GlobalTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool isObscure;
  final Widget? suffixWidget, prefixWidget;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled, isDarkLabel, isRequired, isExpanded;
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
    this.prefixWidget,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.isDarkLabel = false,
    this.isRequired = false,
    this.isExpanded = false,
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
    final field = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label text (only show if provided)
        if (widget.labelText != null) ...[
          Row(
            children: [
              AppText(
                " ${widget.labelText!}",
                style:
                    widget.labelStyle ??
                    (widget.isDarkLabel
                        ? FigmaTextStyles.headline07SemiBold.copyWith(
                            color: AppColors.textPrimary,
                            fontSize: isTablet() ? 7.5.sp : 11.sp,
                          )
                        : FigmaTextStyles.headline07Medium.copyWith(
                            color: widget.isDarkLabel
                                ? AppColors.textPrimary
                                : AppColors.textGreyishDark,
                            fontSize: isTablet() ? 7.5.sp : 11.sp,
                          )),
              ),
              if (widget.isRequired)
                AppText(
                  '*',
                  style: FigmaTextStyles.headline05SemiBold.copyWith(
                    color: Colors.red,
                    // fontSize: isTablet() ? 7.5.sp : 11.sp,
                  ),
                ),
            ],
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
          cursorWidth: 1.5.w,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: FigmaTextStyles.headline07Medium.copyWith(
              color: AppColors.textGreyishLighter,
            ),
            suffixIcon: widget.suffixWidget,
            prefixIcon: widget.prefixWidget,
            prefixIconConstraints: BoxConstraints(
              maxHeight: 24.h,
              // maxWidth: 20.h,
            ),
            contentPadding:
                widget.contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: isTablet() ? 10.w : 14.w,
                  vertical: isTablet() ? 10.h : 12.h,
                ),
            // Border styling
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.25,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.red, width: 1.25),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.r),
              borderSide: const BorderSide(color: Colors.red, width: 1.25),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
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

    return widget.isExpanded ? Expanded(child: field) : field;
  }
}
