import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time_get/selected_country/controller/selected_county_controller.dart';
import 'package:world_time_get/selected_country/view/selected_country_view.dart';

class SelectedCountryScreen extends StatelessWidget {
  final String selectedCounty;
  const SelectedCountryScreen({super.key, required this.selectedCounty});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SelectedCountryController(country: selectedCounty),
      builder: (_) => const SelectedCountrView(),
    );
  }
}
