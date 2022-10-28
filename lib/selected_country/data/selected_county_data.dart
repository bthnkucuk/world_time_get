import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import 'package:world_time_get/selected_country/model/selected_county_model.dart';

class SelectedCountryData {
  static Future<SelectedCountyModel?> getSingleCountries(String country) async {
    final baseUrl = Uri(
      scheme: 'https',
      host: 'worldtimeapi.org',
      path: '/api/timezone/$country',
    );

    // final response = await http.get(baseUrl);

    final response = await retry(
      // Make a GET request
      () => http.get(baseUrl).timeout(const Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) =>
          e is SocketException ||
          e is TimeoutException ||
          e is HandshakeException,
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        final countriesData = jsonDecode(response.body);

        return SelectedCountyModel.fromJson(countriesData);

      default:
        return null;
    }
  }
}
