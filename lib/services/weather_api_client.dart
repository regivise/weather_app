import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:weather_app/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=512c61a6468db14ac3a8fc98733c4aa6&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);

    //print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
