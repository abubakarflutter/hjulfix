import 'package:flutter/material.dart';
import 'package:flutter_multiple_loaders/flutter_multiple_loaders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';
import 'core/app_resources/app_colors.dart';
import 'core/localization/language_provider.dart';
import 'core/localization/translation_data.dart';
import 'core/localization/translation_keys.dart';
import 'core/utils/media_query.dart';

class CustomButton extends ConsumerStatefulWidget {
  /// The text to display on the button
  final dynamic text;

  /// Callback function when the button is pressed
  final VoidCallback? onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// To make the button Outlined
  final bool isOutlined;

  /// Background color of the button (default: green)
  final Color? backgroundColor;

  /// Border radius of the button (default: 100)
  final double buttonHeight;

  /// Border radius of the button (default: 100)
  final double borderRadius;

  /// Animation scale coefficient (default: 0.75)
  final double scaleCoefficient;

  /// Animation duration in milliseconds (default: 1000)
  final int duration;

  /// Button Side Margins
  final EdgeInsets? margin;

  /// Button Row Widget Handling
  final bool isExpanded; // Add this


  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isExpanded = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.margin,
    this.buttonHeight = 44.0,
    this.borderRadius = 10.0,
    this.scaleCoefficient = 0.92,
    this.duration = 1000,
  }) : assert(scaleCoefficient >= 0.0 && scaleCoefficient <= 1.0);

  @override
  ConsumerState createState() => CustomButtonState();
}

class CustomButtonState extends ConsumerState<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  bool isSpringDown = false;
  bool isEnabled = true;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: Duration(milliseconds: widget.duration),
    );

    animationController.value = 1;

    animation = Tween(begin: widget.scaleCoefficient, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void springDown() {
    if (!isEnabled || widget.isLoading) return;

    isSpringDown = true;
    animationController.value = 0;
  }

  Future<void> spring() async {
    if (!isEnabled || widget.isLoading) return;

    isSpringDown = false;
    await Future.delayed(const Duration(milliseconds: 5));

    if (!isSpringDown) {
      animationController.forward();
    }
  }

  Future<void> springUp() async {
    if (!isEnabled || widget.isLoading) return;

    isSpringDown = false;
    await Future.delayed(const Duration(milliseconds: 500));

    if (!isSpringDown) {
      animationController.value = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final button = AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: animation.value,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTapDown: widget.onPressed != null && !widget.isLoading
                ? (_) => springDown()
                : null,
            onTapUp: widget.onPressed != null && !widget.isLoading
                ? (_) => spring()
                : null,
            onTap: widget.onPressed != null && !widget.isLoading
                ? widget.onPressed
                : null,
            onTapCancel: widget.onPressed != null && !widget.isLoading
                ? () => springUp()
                : null,
            child: Container(
              height: isTablet() ? 40.h : widget.buttonHeight.h,
              width: double.infinity,
              margin: widget.margin,
              decoration: BoxDecoration(
                color: widget.backgroundColor ??
                    (widget.isOutlined ? Colors.white : AppColors.primary),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: widget.isOutlined
                    ? Border.all(color: AppColors.borderColor, width: 1.25)
                    : null,
              ),
              child: Center(
                child: widget.isLoading
                    ? SizedBox(
                  height: isTablet() ? 18.h : 22.h,
                  width: isTablet() ? 18.h : 22.h,
                  child: SpinnerLoader(
                    options: LoaderOptions(
                      color: AppColors.buttonLoadingColor,
                      strokeWidth: 3,
                      backgroundColor: AppColors.buttonLoadingBGColor,
                      durationMs: 1000,
                      loop: true,
                    ),
                  ),
                )
                    : Text(
                  _getDisplayText(ref),
                  style: FigmaTextStyles.headline06SemiBold.copyWith(
                    color: widget.isOutlined
                        ? AppColors.textPrimary
                        : Colors.white,
                    fontSize: isTablet()
                        ? 8.5.sp
                        : (widget.isOutlined ? 11.5.sp : 12.sp),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    return widget.isExpanded ? Expanded(child: button) : button;
  }


  String _getDisplayText(WidgetRef ref) {
    // if (!translatable) {
    //   // If not translatable, return as string regardless of type
    //   return widget.text.toString();
    // }

    if (widget.text is TranslationKeys) {
      // FIXED: Use ref.watch() to listen to language changes and get translation directly
      final currentLanguage = ref.watch(languageProvider);
      return TranslationData.getText(currentLanguage, widget.text as TranslationKeys);
    } else if (widget.text is String) {
      // If it's a string, return as is (for backward compatibility)
      return widget.text as String;
    } else {
      // Fallback
      return widget.text.toString();
    }
  }

}