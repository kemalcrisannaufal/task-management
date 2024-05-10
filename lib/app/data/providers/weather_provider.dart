import "dart:convert";

import "package:get/get.dart";
import "package:http/http.dart" as http;

class WeatherProvider extends GetConnect {
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final requestUrl =
        "http://api.weatherapi.com/v1/current.json?key=266d9cafbe554a53b2621112241005&q=" +
            city +
            "&aqi=yes";
    final response = await http.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
