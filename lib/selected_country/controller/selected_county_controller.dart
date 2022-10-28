import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:world_time_get/selected_country/data/selected_county_data.dart';

import '../../state/state.dart';
import '../model/selected_county_model.dart';

class SelectedCountryController extends GetxController {
  final String country;
  SelectedCountryController({required this.country});
  String title = "WORLD TIME";
  Rx<AppStates> status = AppStates.loading.obs;

  Rx<SelectedCountyModel?> data = SelectedCountyModel().obs;

  String timeParser(String dateTimeString, String type) {
    final dateTime = DateTime.parse(dateTimeString);
    final format = DateFormat(type);
    final clockString = format.format(dateTime);
    return clockString;
  }

  Future<SelectedCountyModel?> fetchData(String selectedCountry) async {
    final fetchedData =
        await SelectedCountryData.getSingleCountries(selectedCountry);
    status.value = AppStates.loaded;
    return fetchedData;
  }

  @override
  void onInit() async {
    super.onInit();
    data.value = await fetchData(country);
    // print(data.value!.datetime);
    //  print(data.value!.datetime);
  }
}
