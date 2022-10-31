import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time_get/theme/theme.dart';

class ThemeController extends GetxController {
  final brightness = WidgetsBinding.instance.window.platformBrightness;

  Rx<ThemeMode> appThemeMode = ThemeMode.light.obs;
  ThemeData changeThemee() {
    print(appThemeMode.value);

    if (appThemeMode.value == ThemeMode.dark) {
      appThemeMode.value = ThemeMode.light;

      return lightTheme;
    } else {
      appThemeMode.value = ThemeMode.dark;
      return darkTheme;
    }
  }
}
