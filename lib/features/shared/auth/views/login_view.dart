import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hjulfix_new/core/theme/app_text_styles.dart';
import 'package:hjulfix_new/core/utils/media_query.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_dimens.dart';
import '../../../../core/shared/widgets/base_scaffold.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../core/shared/widgets/custom_text_widget.dart';
import '../../../../test_button.dart';

// Import your providers and other dependencies
import '../models/auth_model.dart';
import '../providers/auth_provider.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(kDebugMode) {
      _emailController.text = "123@hjulfix.dk";
      _passwordController.text = "TeamHjulfix123!";
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref.read(loginNotifierProvider.notifier).login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the login state to get loading status and handle responses
    final loginState = ref.watch(loginNotifierProvider);

    // Listen for state changes to handle success/error
    ref.listen<AsyncValue<AuthModel?>>(loginNotifierProvider, (previous, next) {
      next.when(
        data: (authModel) {
          if (authModel != null) {
            // Login successful - navigate to next screen
            // context.go(RoutePaths.dashboard); // or wherever you want to navigate
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful!')),
            );
          }
        },
        error: (error, stackTrace) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login failed: $error'),
              backgroundColor: Colors.red,
            ),
          );
        },
        loading: () {
          // Optional: You can show additional loading UI here if needed
        },
      );
    });

    return VersatileScaffold(
      // appBar: AppBar(
      //   title: Padding(
      //     padding: const EdgeInsets.only(top: 6),
      //     child: Image.asset(
      //       'assets/logo/hjulfix.png',
      //       width: isTablet() ? 80.w : 165.w,
      //     ),
      //   ),
      // ),
      title: "",
      showBack: true,
      isSimpleBar: true,
      addCenterLogo: true,
      isWhitetBar: true,
      body: AutofillGroup(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.viewHorizontalPadding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                34.verticalSpace,
                AppText(
                  'Sign in to your Account',
                  style: FigmaTextStyles.headline02Bold,
                ),
                5.verticalSpace,
                AppText(
                  'Enter your email and password to log in',
                  style: FigmaTextStyles.headline07Medium.copyWith(
                    color: AppColors.textGreyishDark,
                  ),
                ),
                34.verticalSpace,
                GlobalTextField(
                  controller: _emailController,
                  labelText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                16.verticalSpace,
                GlobalTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  isObscure: true,
                  autofillHints: const [AutofillHints.password],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: isTablet() ? 14.h : 16.h,
                          width: isTablet() ? 14.h : 16.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            border: Border.all(
                              color: AppColors.textGreyishDark,
                            ),
                          ),
                        ),
                        7.horizontalSpace,
                        AppText(
                          'Remember me',
                          style: FigmaTextStyles.headline07Medium.copyWith(
                            color: AppColors.textGreyishDark,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle forgot password
                      },
                      child: AppText(
                        'Forgot Password ?',
                        style: FigmaTextStyles.headline07SemiBold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                35.verticalSpace,
                CustomButton(
                  text: "Log In",
                  isLoading: loginState.isLoading,
                  onPressed: loginState.isLoading ? null : _handleLogin,
                ),
                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: FigmaTextStyles.headline07Medium.copyWith(
                        color: AppColors.textGreyishDark,
                      ),
                    ),
                    6.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        // Navigate to registration page
                      },
                      child: Text(
                        'Create an Account',
                        style: FigmaTextStyles.headline07SemiBold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class LoginView extends ConsumerWidget {
//   const LoginView({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return BaseScaffold(
//       page: Scaffold(
//         appBar: AppBar(
//           // backgroundColor: Colors.green,
//           // leading: Container(
//           //   color: Colors.red,
//           // ),
//           // centerTitle: true,
//           title: Padding(
//             padding: const EdgeInsets.only(top: 6),
//             child: Image.asset(
//               'assets/logo/hjulfix.png',
//               width: isTablet() ? 80.w : 165.w,
//             ),
//           ),
//         ),
//         body: AutofillGroup(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(
//               horizontal: AppDimensions.viewHorizontalPadding,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 34.verticalSpace,
//
//                 AppText(
//                   'Sign in to your Account',
//                   style: FigmaTextStyles.headline02Bold,
//                 ),
//                 5.verticalSpace,
//
//                 AppText(
//                   'Enter your email and password to log in',
//                   style: FigmaTextStyles.headline07Medium.copyWith(
//                     color: AppColors.textSecondaryGreyish,
//                   ),
//                 ),
//
//                 34.verticalSpace,
//
//                 GlobalTextField(
//                   labelText: 'Email Address',
//                   keyboardType: TextInputType.emailAddress,
//                   autofillHints: const [AutofillHints.email], // Email autofill
//                 ),
//                 16.verticalSpace,
//                 GlobalTextField(
//                   labelText: 'Password',
//                   isObscure: true,
//                   autofillHints: const [
//                     AutofillHints.password,
//                   ], // Password autofill
//                 ),
//                 20.verticalSpace,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         //---- Animated Checkbox
//                         Container(
//                           height: isTablet() ? 14.h : 16.h,
//                           width: isTablet() ? 14.h : 16.h,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2.r),
//                             border: Border.all(
//                               color: AppColors.textSecondaryGreyish,
//                             ),
//                           ),
//                         ),
//                         7.horizontalSpace,
//                         AppText(
//                           'Remember me',
//                           style: FigmaTextStyles.headline07Medium.copyWith(
//                             color: AppColors.textSecondaryGreyish,
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     AppText(
//                       'Forgot Password ?',
//                       style: FigmaTextStyles.headline07SemiBold.copyWith(
//                         color: AppColors.primary,
//                       ),
//                     ),
//                   ],
//                 ),
//                 35.verticalSpace,
//                 // CustomButton(
//                 //   text: "Log In",
//                 //   onPressed: () {
//                 //     // context.push(RoutePaths.login);
//                 //   },
//                 // ),
//                 // CustomButton(
//                 //   text: "Log In",
//                 //   isLoading: loginState.isLoading,
//                 //   onPressed: loginState.isLoading ? null : _handleLogin,
//                 // ),
//
//                 30.verticalSpace,
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Don\'t have an account?',
//                       style: FigmaTextStyles.headline07Medium.copyWith(
//                         color: AppColors.textSecondaryGreyish,
//                       ),
//                     ),
//                     6.horizontalSpace,
//                     Text(
//                       'Create an Account',
//                       style: FigmaTextStyles.headline07SemiBold.copyWith(
//                         color: AppColors.primary,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }