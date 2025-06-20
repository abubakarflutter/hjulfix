import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/app_router.dart';
import 'core/services/cache_service.dart';
import 'core/utils/logging.dart';
import 'core/utils/system_utils.dart';
import 'features/shared/welcome/views/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize logger
  await Log.init();

  // Initialize services service
  final cacheService = CacheService();
  await cacheService.init();

  runApp(ProviderScope(child: MyApp()));
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
          title: 'First Method',
          routerConfig: appRouter, // ← GoRouter config
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.noScaling),
              child: child!,
            );
          },
        );
      },
    );

  }
}