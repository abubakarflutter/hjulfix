import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hjulfix_new/core/app_resources/app_assets.dart';

import '../../app_resources/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/media_query.dart';


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
  State<CountryPickerPhoneField> createState() => _CountryPickerPhoneFieldState();
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
        flagSize: 25,
        backgroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16, color: Colors.black87),
        bottomSheetHeight: 500,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
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
            )
        ),
        8.verticalSpace,
        Container(
          decoration: BoxDecoration(
            // color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: const Color(0xFFE0E0E0),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Country picker button
              InkWell(
                onTap: _showCountryPicker,
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  // color: Colors.red,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Flag
                      Text(
                        _selectedCountry.flagEmoji,
                        style: TextStyle(fontSize: 18.sp),
                      ),
                     6.horizontalSpace,
                      // Country code
                      Text(
                        '+${_selectedCountry.phoneCode}',
                          style: FigmaTextStyles.headline07Medium
                      ),
                      6.horizontalSpace,
                      SvgPicture.asset(AppAssets.downArrowNarrowIcon)
                    ],
                  ),
                ),
              ),
              // Vertical divider
              Container(
                height: 35.h,
                width: 1,
                color: const Color(0xFFE0E0E0),
              ),
              // Phone number input
              Expanded(
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  onChanged: widget.onPhoneChanged,
                  cursorColor: AppColors.textPrimary,
                  cursorHeight: isTablet() ? 14.h : 16.h,
                  cursorWidth: 1.5.w,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                    hintText: '1234567890',
                    hintStyle:  FigmaTextStyles.headline07Medium.copyWith(
                        color: AppColors.textGreyishLighter
                    ),
                    isDense: true,
                  ),
                  style: FigmaTextStyles.headline07Medium.copyWith(
                    fontSize: isTablet() ? 8.5.sp : 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}