import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/app_resources/app_assets.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_dimens.dart';
import '../../../../core/theme/app_text_styles.dart';

///------- Calendar
/// A reusable horizontal calendar widget that mimics the UI you shared.
///
/// * Uses **easy_date_timeline: ^2.0.9** under the hood.
/// * The month label is tap‑able and opens the built‑in month/year picker.
/// * Selected day gets a filled circle with the app’s primary green, the rest are
///   outlined circles.
class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.onDateSelected,
  });

  /// The date that will be highlighted when the timeline first appears.
  final DateTime initialDate;

  /// Earliest date the user can scroll back to.
  final DateTime firstDate;

  /// Latest date the user can scroll forward to.
  final DateTime lastDate;

  /// Optional callback whenever the user picks a new date.
  final ValueChanged<DateTime>? onDateSelected;

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  late DateTime _selectedDate;
  final _controller = EasyDatePickerController();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  ‑‑ tweak this to match your brand colour.
    const Color primaryGreen = AppColors.primary;
    final base = Theme.of(context);

    return Theme(
      data: ThemeData(
        colorScheme: base.colorScheme.copyWith(
          surface: Colors.white,
          // keep your brand green for selections:
          primary: AppColors.primary,
          onPrimary: Colors.white,
          onSurface: AppColors.textPrimary,
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
      ),
      child: Builder(
        builder: (context) {
          return EasyTheme(
            // We only override the parts we need – colours & borders.
            data: EasyTheme.of(context).copyWithState(
              selectedOverlayColor: Colors.grey.withValues(alpha: .1),
              disabledOverlayColor: Colors.grey.withValues(alpha: .1),
              unselectedOverlayColor: Colors.grey.withValues(alpha: .1),

              // ---- MONTH ----------------------------------------------------------
              selectedMonthTheme: const MonthYearThemeData(
                backgroundColor: primaryGreen,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              unselectedMonthTheme: MonthYearThemeData(
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.textGreyishLighter,
                textStyle: TextStyle(fontSize: 16),
              ),
              // ---- YEAR -----------------------------------------------------------
              selectedYearTheme: const MonthYearThemeData(
                backgroundColor: primaryGreen,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              unselectedYearTheme: MonthYearThemeData(
                foregroundColor: AppColors.textGreyishLighter,
                textStyle: const TextStyle(fontSize: 14),
              ),
            ),
            child: EasyDateTimeLinePicker.itemBuilder(
              controller: _controller,
              firstDate: widget.firstDate,
              lastDate: widget.lastDate,
              focusedDate: _selectedDate,
              itemExtent: 52.w, // width of every day cell
              daySeparatorPadding: 10.w,

              // Custom header that shows e.g. "July 2025" with a▼ icon
              headerOptions: HeaderOptions(
                headerBuilder: (context, date, onTap) => InkWell(
                  onTap:
                      onTap, // opens month/year picker provided by the package
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          (AppDimensions.viewHorizontalPadding).horizontalSpace,
                          Text(
                            DateFormat.yMMMM().format(date),
                            style: FigmaTextStyles.headline05SemiBold,
                            // const TextStyle(
                            //   fontSize: 20,
                            //   fontWeight: FontWeight.w600,
                            // ),
                          ),
                          8.horizontalSpace,
                          SvgPicture.asset(AppAssets.downArrowIcon),
                        ],
                      ),
                      12.verticalSpace,
                    ],
                  ),
                ),
              ),
              onDateChange: (date) {
                setState(() => _selectedDate = date);
                widget.onDateSelected?.call(date);
              },
              // Build every individual day cell so we have full control.
              itemBuilder:
                  (context, date, isSelected, isDisabled, isToday, onTap) {
                    // Colours that switch depending on state.
                    final bg = isSelected ? primaryGreen : Colors.white;
                    final border = isSelected
                        ? primaryGreen
                        : AppColors.borderColor;
                    final dayNumStyle = FigmaTextStyles.headline04SemiBold
                        .copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppColors.textPrimary,
                        );
                    final dayStrStyle = FigmaTextStyles.paragraphSmallMedium
                        .copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppColors.textGreyishLighter,
                        );

                    return GestureDetector(
                      onTap: isDisabled ? null : onTap,
                      child: Container(
                        // height: 10.h,
                        // width: 64,
                        // padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: border),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              DateFormat('MMM').format(date),
                              style: dayStrStyle,
                            ),
                            // 01 … 31
                            Text(
                              DateFormat('dd').format(date),
                              style: dayNumStyle,
                            ),
                            // 4.verticalSpace,
                            // Mo / Tu / We …
                            Text(
                              DateFormat.E().format(date),
                              style: dayStrStyle,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
              timelineOptions: TimelineOptions(
                height: 80.h,
                padding: EdgeInsets.zero,
              ),
              monthYearPickerOptions: MonthYearPickerOptions(
                initialCalendarMode: EasyDatePickerMode.month,
                confirmText: 'Confirm',
                cancelText: 'Cancel',

                // 👇 THIS fixes the background & chip colours inside the sheet
                builder: (context, child) {
                  final base = Theme.of(context);

                  return Theme(
                    data: base.copyWith(
                      // 1️⃣  100 % white dialog background
                      dialogTheme: const DialogThemeData(
                        backgroundColor: Colors.white,
                        surfaceTintColor:
                            Colors.white, // removes the M3 “tint” overlay
                      ),

                      // 2️⃣  Make sure *surface* & *background* are white too, or M3
                      //     will draw the surface colour behind the dialog.
                      colorScheme: base.colorScheme.copyWith(
                        surface: Colors.white,
                        // background: Colors.white,
                        // keep your brand green for selections:
                        primary: AppColors.primary,
                        onPrimary: Colors.white,
                        onSurface: AppColors.textPrimary,
                      ),

                      // 3️⃣  Optional: global text tweaks just for the picker
                      textTheme: base.textTheme.apply(
                        bodyColor: AppColors.textPrimary,
                        displayColor: AppColors.textPrimary,
                      ),
                    ),
                    child: child!,
                  );
                },
              ),

              // monthYearPickerOptions: MonthYearPickerOptions(
              //   initialCalendarMode: EasyDatePickerMode.month, // default
              //   cancelText: 'Cancel',
              //   confirmText: 'Confirm',
              //   cancelTextStyle: FigmaTextStyles.headline05SemiBold.copyWith(
              //     color: AppColors.primary,
              //   ),
              //   confirmTextStyle: FigmaTextStyles.headline05SemiBold.copyWith(
              //     color: AppColors.primary,
              //   ),
              //   // builder: (context, child) => Theme(
              //   //   data: Theme.of(context).copyWith(
              //   //     dialogTheme: DialogThemeData(
              //   //       backgroundColor: Colors.white,
              //   //       surfaceTintColor: Colors.transparent,
              //   //     ),
              //   //     colorScheme: Theme.of(context).colorScheme.copyWith(
              //   //       primary: primaryGreen,
              //   //       onPrimary: Colors.red,
              //   //       onSurface: Colors.indigoAccent,
              //   //       onSecondary: Colors.orange,
              //   //       secondary: Colors.purpleAccent,
              //   //     ),
              //   //   ),
              //   //   child: child!,
              //   // ),
              //   // ... other properties
              // ),
            ),
          );
        },
      ),
    );
  }
}
