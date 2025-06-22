import 'package:flutter/material.dart';
import 'package:flutter_multiple_loaders/flutter_multiple_loaders.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_resources/app_colors.dart';
import 'core/configs/app_configs.dart';
import 'core/utils/media_query.dart';

class CustomButton extends StatefulWidget {
  /// The text to display on the button
  final String text;

  /// Callback function when the button is pressed
  final VoidCallback? onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Background color of the button (default: green)
  final Color? backgroundColor;

  /// Border radius of the button (default: 100)
  final double borderRadius;

  /// Animation scale coefficient (default: 0.75)
  final double scaleCoefficient;

  /// Animation duration in milliseconds (default: 1000)
  final int duration;

  /// Button Side Margins
  final EdgeInsets? margin;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.margin,
    this.borderRadius = 100.0,
    this.scaleCoefficient = 0.92,
    this.duration = 1000,
  }) : assert(scaleCoefficient >= 0.0 && scaleCoefficient <= 1.0);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton>
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
    return AnimatedBuilder(
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
              height: isTablet() ? 40.h : 45.h,
              // height: 45.h,
              width: double.infinity,
              // padding: EdgeInsets.symmetric(
              //   vertical: 12.h
              // ),
              margin: widget.margin,
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? AppColors.primary,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                // gradient: LinearGradient(
                //   colors: [
                //     Color(0xff276740),
                //     Color(0xff408D5A),
                //     Color(0xff276740),
                //   ],
                //   begin: Alignment.centerLeft,
                //   end: Alignment.centerRight,
                //   // stops: [0.0, 1.0],
                //   // tileMode: TileMode.clamp
                // ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.1),
                //     blurRadius: 8,
                //     offset: const Offset(0, 4),
                //   ),
                // ],
              ),
              child: Center(
                child: widget.isLoading
                    ? SizedBox(
                        height: isTablet() ? 18.h : 22.h,
                        width: isTablet() ? 18.h : 22.h,

                        child: SpinnerLoader(
                          options: LoaderOptions(
                            color: AppColors.buttonLoadingColor,
                            // size: LoaderSize.small,
                            strokeWidth: 3,
                            backgroundColor: AppColors.buttonLoadingBGColor,
                            durationMs: 1000,
                            loop: true,
                          ),
                        ),
                      )
                    : Text(
                        widget.text,
                        style: TextStyle(
                          color: AppColors.buttonTextColor,
                          fontFamily: AppConfigs.appFontFamily,
                          // fontSize: 14.sp,
                          fontSize: isTablet() ? 8.5.sp : 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
