import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hjulfix_new/core/shared/widgets/base_scaffold.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';
import 'package:hjulfix_new/core/utils/media_query.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_dimens.dart';
import '../../../../core/localization/language_model.dart';
import '../../../../core/localization/language_provider.dart';
import '../../../../core/localization/translation_keys.dart';
import '../../../../core/routes/route_paths.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../test_button.dart';
import '../../auth/repo/auth_repo.dart';
import '../providers/state_providers.dart';
import '../widgets/lang_selection.dart';

class WelcomeView extends ConsumerWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
      isWhitetBar: true,
      isSimpleBar: true,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/logo/welcome_screen_wheel.jpg',
              height: 250.h,
              fit: BoxFit.contain,
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  TranslationKeys.welcomeTo,
                  style: FigmaTextStyles.headline01Bold,
                ),
                6.horizontalSpace,
                Image.asset(
                  'assets/logo/hjulfix-without-wheel.png',
                  width: isTablet() ? 80.w : 110.w,
                ),
              ],
            ),
            6.verticalSpace,
            AppText(
              TranslationKeys.professionalRimRenovation,
              style: FigmaTextStyles.headline07Medium.copyWith(
                color: AppColors.textGreyishDark,
              ),
            ),
            const Spacer(),

            Container(
              padding: EdgeInsets.all(AppDimensions.viewHorizontalPadding),
              margin: isTablet()
                  ? null
                  : EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(
                  colors: [const Color(0xFFF7F7F7), const Color(0xFFFFFFFF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // stops: [0.0, 1.0],
                  // tileMode: TileMode.clamp
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.8.r),
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 0.78,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/lang-icon.svg',
                      height: isTablet() ? 16.sp : 22.sp,
                      // colorFilter: ColorFilter.mode(Colors., blendMode),
                    ),
                  ),
                  12.verticalSpace,
                  AppText(
                    TranslationKeys.selectLanguage,

                    style: FigmaTextStyles.headline04Bold,
                  ),
                  2.verticalSpace,
                  AppText(
                    TranslationKeys.chooseFavoriteLanguage,

                    style: FigmaTextStyles.headline07Medium.copyWith(
                      color: AppColors.textGreyishDark,
                    ),
                  ),
                  16.verticalSpace,
                  Consumer(
                    builder: (context, ref, child) {
                      final currentLanguage = ref.watch(languageProvider);

                      return Row(
                        children: Language.supportedLanguages.map((language) {
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right:
                                language ==
                                    Language.supportedLanguages.last
                                    ? 0
                                    : 12.w,
                              ),
                              child: LanguageSelectionCard(
                                language: language,
                                isSelected: currentLanguage == language.code,
                                onTap: () async {
                                  // Change language instantly
                                  await ref
                                      .read(languageProvider.notifier)
                                      .changeLanguage(language.code);
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  24.verticalSpace,
                  Consumer(
                    builder: (context, ref, child) {
                      final authRepo = ref.read(authRepositoryProvider);
                      final isLoggedIn = authRepo.isLoggedIn();
                      final isLoading = ref.watch(localLoaderProvider);
                      return CustomButton(
                        text: TranslationKeys.continueButton,
                        isLoading: isLoading,
                        onPressed: () async {
                          ref.read(localLoaderProvider.notifier).state = true;
                          await Future.delayed(Duration(milliseconds: 1000));
                          ref.read(localLoaderProvider.notifier).state =
                          false;
                          if (context.mounted) {
                            isLoggedIn ?
                            context.push(RoutePaths.adminBottomNav)
                                :
                            context.push(RoutePaths.login);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ), title: '',
    );
  }
}