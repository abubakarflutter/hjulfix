import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hjulfix_new/core/app_resources/app_assets.dart';

import '../../app_resources/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/media_query.dart';
import '../../utils/system_utils.dart';

class CountryPickerPhoneField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final Function(String)? onPhoneChanged;
  final Function(Country)? onCountryChanged;
  final String? initialPhoneNumber;

  const CountryPickerPhoneField({
    super.key,
    required this.label,
    this.controller,
    this.onPhoneChanged,
    this.onCountryChanged,
    this.initialPhoneNumber,
  });

  @override
  State<CountryPickerPhoneField> createState() =>
      _CountryPickerPhoneFieldState();
}

class _CountryPickerPhoneFieldState extends State<CountryPickerPhoneField> {
  late TextEditingController _phoneController;
  Country _selectedCountry = Country(
    phoneCode: '45',
    countryCode: 'DK',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Denmark',
    example: 'Denmark',
    displayName: 'Denmark',
    displayNameNoCountryCode: 'DK',
    e164Key: '',
  );

  @override
  void initState() {
    super.initState();
    _phoneController = widget.controller ?? TextEditingController();
    if (widget.initialPhoneNumber != null) {
      _phoneController.text = widget.initialPhoneNumber!;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _phoneController.dispose();
    }
    super.dispose();
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,

      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
        if (widget.onCountryChanged != null) {
          widget.onCountryChanged!(country);
        }
      },
      countryListTheme: CountryListThemeData(
        flagSize: 22.sp,
        backgroundColor: Colors.white,
        textStyle: FigmaTextStyles.headline06SemiBold,
        bottomSheetHeight: 500,
        searchTextStyle: FigmaTextStyles.headline06Medium,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        inputDecoration: InputDecoration(
          // labelText: 'Search',
          contentPadding: EdgeInsets.symmetric(
            horizontal: isTablet() ? 10.w : 14.w,
            vertical: isTablet() ? 10.h : 12.h,
          ),
          isDense: true,
          filled: true,
          fillColor: Colors.grey.shade50,
          hintText: 'Start typing to search',
          hintStyle: FigmaTextStyles.headline06Medium.copyWith(
            color: AppColors.textGreyishLighter,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 14.w, right: 8.w),
            child: SvgPicture.asset(AppAssets.searchIcon),
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 24.h,
            // maxWidth: 20.h,
          ),
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
            borderSide: const BorderSide(color: AppColors.primary, width: 1),
          ),
        ),
      ),
    );
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: FigmaTextStyles.headline07SemiBold.copyWith(
            fontSize: isTablet() ? 7.5.sp : 11.sp,
          ),
        ),
        8.verticalSpace,
        Row(
          children: [
            /// Country picker button
            // InkWell(
            //   onTap: _showCountryPicker,
            //   borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(10.r),
            //     bottomLeft: Radius.circular(10.r),
            //   ),
            //   child: Container(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 12.w,
            //       vertical: 8.h,
            //     ),
            //     // color: Colors.red,
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         // Flag
            //         Text(
            //           _selectedCountry.flagEmoji,
            //           style: TextStyle(fontSize: 18.sp),
            //         ),
            //         6.horizontalSpace,
            //         // Country code
            //         Text(
            //           '+${_selectedCountry.phoneCode}',
            //           style: FigmaTextStyles.headline07Medium,
            //         ),
            //         6.horizontalSpace,
            //         SvgPicture.asset(AppAssets.downArrowNarrowIcon),
            //       ],
            //     ),
            //   ),
            // ),
            /// Vertical divider
            // Container(height: 35.h, width: 1, color: const Color(0xFFE0E0E0)),
            /// Phone number input
            Expanded(
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                onChanged: widget.onPhoneChanged,
                cursorColor: AppColors.textPrimary,
                cursorHeight: isTablet() ? 14.h : 16.h,
                cursorWidth: 1.5.w,
                textAlignVertical: TextAlignVertical.center,
                onTapOutside: (PointerDownEvent event) {
                  SystemMethods.dismissKeyboard();
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    // left: 16.w,
                    right: 16.w,
                    // vertical: 0,
                  ),
                  hintText: '1234567890',
                  hintStyle: FigmaTextStyles.headline07Medium.copyWith(
                    color: AppColors.textGreyishLighter,
                  ),
                  isDense: true,
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
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.25,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.r),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.25,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 1.0,
                    ),
                  ),
                  prefixIcon:
                      // Country picker button
                      InkWell(
                        onTap: _showCountryPicker,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(2).w,
                          padding: EdgeInsets.only(
                            left: 9.w,
                            right: 7.w,
                            top: 6.h,
                            bottom: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              bottomLeft: Radius.circular(10.r),
                            ),
                            border: Border(
                              right: BorderSide(color: AppColors.borderColor),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Flag
                              Text(
                                _selectedCountry.flagEmoji,
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              7.horizontalSpace,
                              // Country code
                              Text(
                                '+${_selectedCountry.phoneCode}',
                                style: FigmaTextStyles.headline07Medium,
                              ),
                              7.horizontalSpace,
                              SvgPicture.asset(
                                AppAssets.downArrowNarrowIcon,
                                colorFilter: ColorFilter.mode(
                                  AppColors.textGreyishLightest,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  prefixIconConstraints: BoxConstraints(maxWidth: 110.w),
                ),
                style: FigmaTextStyles.headline07Medium.copyWith(
                  fontSize: isTablet() ? 8.5.sp : 12.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
