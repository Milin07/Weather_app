import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/weatherModel.dart';

class WeatherData {
  Future<weather> getData(var latitude, var longitude) async {
    var uricall = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=1051065a8dcf4019af0115003240108&q=$latitude,$longitude&aqi=no");
    var response = await http.get(uricall);
    var body = jsonDecode(response.body);
    return weather.fromJson(body);
  }
}
