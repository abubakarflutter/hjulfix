import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hjulfix_new/core/app_resources/app_assets.dart';

import '../../../../core/app_resources/app_colors.dart';

class BottomNavView extends ConsumerStatefulWidget {
  const BottomNavView({super.key});

  @override
  ConsumerState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends ConsumerState<BottomNavView> {

  int index = 0;
  List<Widget> screens = const [
    Center(
      child: Text('Dashboard'),
    ),
    Center(
      child: Text('Vehicles'),
    ),
    Center(
      child: Text('Offers'),
    ),
    Center(
      child: Text('Jobs'),
    ),
    Center(
      child: Text('More'),
    ),
  ];

  Future<bool> onWillPop() async {
    if (index != 0) {
      // logic.changeCurrentPage(0);
      return false;
    } else {
      // final value = await showExitDialog(context);
      // if (value != null) {
      //   return value;
      // } else {
      //   return value;
      // }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: IndexedStack(
          index: index,
          children: screens,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor: Colors.white,
              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return TextStyle(
                    color: AppColors.primary,
                    fontFamily: "Montserrat",
                    fontSize: 10.5.sp,
                      fontWeight: FontWeight.w600

                  );
                }
                return TextStyle(
                  color: Color(0xff8F959E),
                  fontFamily: "Montserrat",
                  fontSize: 10.25.sp,
                  fontWeight: FontWeight.w500
                );
              }),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset:
                  Offset(0, -5), // Negative y-offset for upper shadow
                  spreadRadius: 0,
                ),
              ],
            ),
            child: NavigationBar(
              backgroundColor: Colors.white,
              onDestinationSelected: (value) {
                HapticFeedback.lightImpact();
                setState(() {
                  index = value;
                });
              },
              selectedIndex: index,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              // elevation: 100,
              height: 65.h, // Adjust this value as needed
              indicatorColor: AppColors.primary.withOpacity(.2),
              animationDuration: const Duration(milliseconds: 800),
              // surfaceTintColor: AppColors.primaryOrange.withOpacity(.2),
              overlayColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.primary.withOpacity(.2);
                }
                return AppColors.primary.withOpacity(.2);
              }),
              destinations: [
                _buildNavBarDestination(
                  icon: AppAssets.navHomeOutlineIcon,
                  activeIcon: AppAssets.navHomeFilledIcon,
                  label: "Home",
                  itemIndex: 0,
                ),
                _buildNavBarDestination(
                  icon: AppAssets.navVehicleOutlineIcon,
                  activeIcon: AppAssets.navVehicleFilledIcon,
                  label: "Vehicles",
                  itemIndex: 1,
                  outlineIconSize: 27,
                  filledIconSize: 20
                ),
                _buildNavBarDestination(
                  icon: AppAssets.navOffersOutlineIcon,
                  activeIcon: AppAssets.navOffersFilledIcon,
                  label: "Offers",
                  itemIndex: 2,
                  isCart: true,
                ),
                _buildNavBarDestination(
                  icon: AppAssets.navJobsOutlineIcon,
                  activeIcon: AppAssets.navJobsFilledIcon,
                  label: "Jobs",
                  itemIndex: 3,
                ),
                _buildNavBarDestination(
                  icon: AppAssets.navMoreOutlineIcon,
                  activeIcon: AppAssets.navMoreFilledIcon,
                  label: "More",
                  itemIndex: 4,
                  filledIconSize: 20
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  NavigationDestination _buildNavBarDestination({
    required String icon,
    required String activeIcon,
    required String label,
    required int itemIndex,
    bool isCart = false,
    int filledIconSize = 22,
    int outlineIconSize = 22
  }) {
    return NavigationDestination(
      label: label,
      tooltip: label,
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            icon,
            height: outlineIconSize.h,
          )
        ],
      ),
      selectedIcon: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            activeIcon,
            color: AppColors.primary,
            height: filledIconSize.h,
          ),
        ],
      ),
    );
  }
}