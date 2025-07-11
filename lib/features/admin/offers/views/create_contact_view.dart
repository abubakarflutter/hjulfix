import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hjulfix_new/core/app_resources/app_assets.dart';
import 'package:hjulfix_new/core/app_resources/app_colors.dart';
import 'package:hjulfix_new/core/shared/widgets/custom_text_field.dart';
import 'package:hjulfix_new/test_button.dart';

import '../../../../core/app_resources/app_dimens.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';
import '../../../../core/shared/widgets/custom_phone_number_field.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../core/shared/widgets/dropdonw_options_field.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/media_query.dart';

class CreateContactView extends ConsumerWidget {
  const CreateContactView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
      title: "Create New Contact",
      showBack: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.viewHorizontalPadding,
          vertical: AppDimensions.viewHorizontalPadding,
        ),
        child: Column(
          children: [
            GlobalTextField(
              labelText: 'Full Name',
              isDarkLabel: true,
              isRequired: true,
            ),
            14.verticalSpace,
            GlobalTextField(
              labelText: 'Email Address',
              isDarkLabel: true,
              isRequired: true,
            ),
            14.verticalSpace,

            CountryPickerPhoneField(
              label: 'Phone number*',
              onPhoneChanged: (phone) {
                print('Phone changed: $phone');
              },
              onCountryChanged: (country) {
                print('Country changed: ${country.name} (+${country.phoneCode})');
              },
            ),

            14.verticalSpace,
            GlobalTextField(
              labelText: 'Telephone Fax Number',
              isDarkLabel: true,
            ),
            14.verticalSpace,
            Row(
              children: [
                CustomDropDownField(
                  labelText: 'Country',
                  isRequired: true,
                  isFlexible: true,
                ),
                12.horizontalSpace,
                CustomDropDownField(
                  labelText: 'City',
                  isRequired: true,
                  isFlexible: true,
                ),
              ],
            ),
            14.verticalSpace,
            Row(
              children: [
                GlobalTextField(
                  labelText: 'Postcode',
                  isDarkLabel: true,
                  isRequired: true,
                  isExpanded: true,
                ),
                10.horizontalSpace,
                GlobalTextField(
                  labelText: 'Website',
                  isDarkLabel: true,
                  isExpanded: true,
                ),
              ],
            ),
            14.verticalSpace,
            GlobalTextField(
              labelText: 'Address',
              isDarkLabel: true,
              isRequired: true,
              maxLines: 3,
            ),
            14.verticalSpace,
            Row(
              children: [
                CustomDropDownField(
                  labelText: 'Customer Group',
                  isRequired: true,
                  isFlexible: true,
                ),
                12.horizontalSpace,
                CustomDropDownField(
                  labelText: 'Avt Zone',
                  isRequired: true,
                  isFlexible: true,
                ),
              ],
            ),
            14.verticalSpace,
            CustomDropDownField(
              labelText: 'Payment Terms',
              isRequired: true,
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               AppText('   If customer is business?',
                style: FigmaTextStyles.headline06SemiBold,
               ),
                Checkbox(
                  value: false,
                  onChanged: (value) {
                    // authC.trustThiDevice.value = value ?? false;
                  },
                  activeColor: AppColors
                      .primary, // Background color when checked
                  checkColor:
                  Colors.white, // Tick color when checked
                  fillColor: WidgetStateProperty.resolveWith<Color>(
                        (states) {
                      if (states.contains(WidgetState.selected)) {
                        return AppColors
                            .primary; // Color when checked
                      }
                      return Colors
                          .white; // Background color when unchecked
                    },
                  ),

                  side: const BorderSide(
                      color: Colors.grey, width: 1.0),
                ),

              ],
            ),
            10.verticalSpace,
            CustomButton(text: 'Confirm & Create Contact'),
            10.verticalSpace,

          ]
        ),
      ),
    );

  }
}