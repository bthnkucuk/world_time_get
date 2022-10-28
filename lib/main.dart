import 'package:flutter/material.dart';
import 'package:world_time_get/home/home_screen.dart';
import 'package:world_time_get/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}