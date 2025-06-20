import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemMethods {

  static initSystemConfig(){
    setAppOrientationToUp();
    setNavigationToWhite();
  }


  static setAppUIMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top]);
  }

  static setAppOrientationToUp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
    ]);
  }

  static dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static setNavigationToWhite({Color navBGColor = Colors.white}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: navBGColor,
      statusBarColor: Colors.transparent,
      // systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness:
      Brightness.dark, // Navigation bar icons
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
    ));
  }

  static void setImageCache() {
    WidgetsFlutterBinding.ensureInitialized();
    final ImageCache imageCache = PaintingBinding.instance.imageCache;
    imageCache.maximumSizeBytes = (1024 * 1024 * 100) * 30;
  }


}