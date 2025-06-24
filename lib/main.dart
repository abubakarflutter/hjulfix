import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/localization/language_provider.dart';
import 'core/network/api_client.dart';
import 'core/network/network_info.dart';
import 'core/routes/app_router.dart';
import 'core/services/cache_service.dart';
import 'core/shared/providers/app_global_providers.dart' hide cacheServiceProvider, apiClientProvider;
import 'core/theme/app_theme.dart';
import 'core/utils/logging.dart';
import 'core/utils/system_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize logger
  await Log.init();

  // Initialize cache service
  final cacheService = CacheService();
  await cacheService.init();

  // Initialize network info
  final networkInfo = NetworkInfoImpl(Connectivity());

  // Initialize API client with dependencies
  final apiClient = ApiClient(
    networkInfo: networkInfo,
    cacheService: cacheService,
  );

  runApp(
    ProviderScope(
      overrides: [
        // Override cache service with initialized instance
        cacheServiceProvider.overrideWithValue(cacheService),

        // Override network info with initialized instance
        networkInfoProvider.overrideWithValue(networkInfo),

        // Override API client with initialized instance
        apiClientProvider.overrideWithValue(apiClient),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemMethods.initSystemConfig();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'HJULFIX ®',
          routerConfig: appRouter, // ← GoRouter config
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.noScaling),
              child: child!,
            );
          },
        );
      },
    );
  }
}