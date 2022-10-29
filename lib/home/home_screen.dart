import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time_get/home/view/home_view.dart';

import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (_) => HomeView(),
    );
  }
}
