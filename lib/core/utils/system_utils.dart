import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemMethods {
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

  static void setImageCache() {
    WidgetsFlutterBinding.ensureInitialized();
    final ImageCache imageCache = PaintingBinding.instance.imageCache;
    imageCache.maximumSizeBytes = (1024 * 1024 * 100) * 30;
  }

  //--- add other system level functions

}