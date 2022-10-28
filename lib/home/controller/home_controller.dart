import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:world_time_get/home/data/home_repository.dart';

import '../../state/state.dart';

class HomeController extends GetxController {
  Rx<AppStates> status = AppStates.loading.obs;
  RxList displayedData = [].obs;

  List data = [];

  TextEditingController textEditingController = TextEditingController();
  DateTime now = DateTime.now();

  final String goodMorning = "Günaydın, Özgür!";
  final String goodDays = "İyi Günler, Özgür!";
  final String hintText = "Arama";

  String timeParser(String dateTimeString, String type) {
    final dateTime = DateTime.parse(dateTimeString);

    final format = DateFormat(type);
    final clockString = format.format(dateTime);

    return clockString;
  }

  void searchedCountryData(String searchedKey) {
    displayedData.value = data
        .where((element) => element
            .toString()
            .toLowerCase()
            .contains(searchedKey.toLowerCase()))
        .toList();
  }

  fetchData() async {
    try {
      data = await ClockCountryData.getCountries();
      displayedData.value = data;
      status.value = AppStates.loaded;
    } catch (e) {
      status.value = AppStates.loaded;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
}
