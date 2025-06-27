// versatile_scaffold.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hjulfix_new/core/app_resources/app_dimens.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';
import '../../app_resources/app_colors.dart';
import '../../utils/media_query.dart'; // isTablet()

class VersatileScaffold extends StatelessWidget {
  const VersatileScaffold({
    super.key,
    // core
    required this.body,
    required this.title,
    this.subtitle,
    // behaviour
    this.showBack        = false,
    this.actions,
    // flexible-space
    this.flexibleContent,
    this.flexibleHeight  = 150.0,
    // NEW flags
    this.isWhitetBar = false,
    this.addCenterLogo    = false,
    this.isSimpleBar      = false,
  });

  // ──────────────── public API ────────────────
  final Widget body;
  final String title;
  final String? subtitle;

  final bool showBack;
  final List<Widget>? actions;

  final Widget? flexibleContent;
  final double  flexibleHeight;

  // new
  final bool isWhitetBar;
  final bool addCenterLogo;
  final bool isSimpleBar;
  // ────────────────────────────────────────────

  // ───────────────── scaffold build ─────────────────
  @override
  Widget build(BuildContext context) {
    return isSimpleBar ? _buildSimpleScaffold(context) : _buildSliverScaffold(context);
  }

  // ───────────────── SIMPLE (regular AppBar) ─────────────────
  Widget _buildSimpleScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor:
      isWhitetBar ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isWhitetBar ? Colors.white : Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: addCenterLogo,
        leading: showBack
            ? IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.maybePop(context),
        )
            : null,
        title: addCenterLogo
            ? _logoWidget()
            : Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.black),
          ),
        ),
        actions: actions,
      ),
      body: _bodyContainer(context),
    );
  }

  // ───────────────── SLIVER (scrollable AppBar) ─────────────────
  Widget _buildSliverScaffold(BuildContext context) {
    final double expandedHeight =
    flexibleContent != null ? flexibleHeight.clamp(kToolbarHeight, 500.0) : kToolbarHeight;

    return Scaffold(
      backgroundColor:
      isWhitetBar ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        // physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            // floating: flexibleContent != null,
            expandedHeight: expandedHeight,
            backgroundColor: isWhitetBar ? Colors.white : Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            leading: showBack
                ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () => Navigator.maybePop(context),
            )
                : null,
            actions: actions,
            titleSpacing: 0,
            title: addCenterLogo ? _logoWidget() : _buildTextTitle(context),
            flexibleSpace:
            isWhitetBar ? null : _buildGradientFlexibleSpace(), // skip gradient on white
          ),

          // Page body with tablet constraint
          SliverToBoxAdapter(
            // hasScrollBody: true,
            child: _bodyContainer(context),
          ),
        ],
      ),
    );
  }

  // ───────────────── HELPERS ─────────────────
  Widget _bodyContainer(BuildContext context) => Align(
    alignment: Alignment.topCenter,
    child: SizedBox(
      width: isTablet()
          ? MediaQuery.of(context).size.width * 0.60
          : double.infinity,
      child: body,
    ),
  );

  Widget _logoWidget() => Padding(
    padding: const EdgeInsets.only(top: 6.0),
    child: Image.asset(
      'assets/logo/hjulfix.png',
      width: isTablet() ? 80 : 165, // use .w if screenutil is in scope
    ),
  );

  Widget _buildTextTitle(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: AppDimensions.viewHorizontalPadding),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
      subtitle == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FigmaTextStyles.headline04Bold.copyWith(color: Colors.white),
        ),
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: FigmaTextStyles.headline06Medium.copyWith(
              color: AppColors.appSubTitleColor
            ),
          ),
        ],
      ],
    ),
  );

  Widget? _buildGradientFlexibleSpace() {
    // if (flexibleContent == null) return null;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xFF15813D), Color(0xFF16A24A)], // light → dark green
        ),
      ),
      child: flexibleContent != null ? FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: flexibleContent,
      ) : null,
    );
  }
}