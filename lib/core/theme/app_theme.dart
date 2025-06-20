import 'package:flutter/material.dart';
import '../app_resources/app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        // colorScheme: const ColorScheme.light(
        //     primary: AppColors.primaryLight,
        //     secondary: AppColors.secondaryLight,
        //     error: AppColors.error,
        //     background: AppColors.white
        // ),
        scaffoldBackgroundColor: AppColors.scaffoldBGColor,
        primaryTextTheme: AppTextTheme.textTheme,
        textTheme: AppTextTheme.textTheme,
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: AppColors.scaffoldBGColor,
            scrolledUnderElevation: 0,
            // titleTextStyle: AppTextStyles.titleMedium
        ),
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
            // shadowColor: AppColors.bottomSheetShadowLight
        ),
        drawerTheme: const DrawerThemeData(
            backgroundColor: Colors.white,
            // shadowColor: AppColors.drawerShadowLight
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        // brightness: Brightness.dark,
        // primaryColor: AppColors.primaryDark,
        // colorScheme: const ColorScheme.dark(
        //     primary: AppColors.primaryDark,
        //     secondary: AppColors.secondaryDark,
        //     error: AppColors.error,
        //     background: AppColors.backgroundDark),
        // scaffoldBackgroundColor: AppColors.backgroundDark,
        // primaryTextTheme: AppTextTheme.darkTextTheme,
        // textTheme: AppTextTheme.darkTextTheme,
        // appBarTheme: AppBarTheme(
        //     elevation: 0,
        //
        //     backgroundColor: AppColors.backgroundDark,
        //     titleTextStyle: AppTextStyles.titleMedium),
        // bottomSheetTheme: const BottomSheetThemeData(
        //     backgroundColor: AppColors.bottomSheetDark,
        //     shadowColor: AppColors.bottomSheetShadowDark),
        // drawerTheme: const DrawerThemeData(
        //     backgroundColor: AppColors.drawerDark,
        //     shadowColor: AppColors.drawerShadowDark),
        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //   backgroundColor: AppColors.backgroundDark,
        // )
    );
  }
}