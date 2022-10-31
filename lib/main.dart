import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time_get/home/home_screen.dart';
import 'package:world_time_get/theme/theme.dart';
import 'package:world_time_get/theme/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeController.appThemeMode.value,
      home: const HomeScreen(),
    );
  }
}
