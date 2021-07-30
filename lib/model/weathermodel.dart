import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

WeatherModel weather = WeatherModel();
int temperature = 0;
String tempDisplay = '';
String tempDisplayFahrenheit = '';
int temperatureFahrenheit = 0;
String cityName = '';
String weatherMessage = '';
double newHeight = 0;
String weatherPNG = 'http://openweathermap.org/img/wn/03d@2x.png';
late SvgPicture svgBG;

void updateUI(dynamic weatherData) {
  if (weatherData == null) {
    //temperature = 0;
    tempDisplay = '--';
    tempDisplayFahrenheit = '--';
    weatherPNG = 'http://openweathermap.org/img/wn/03d@2x.png';
    //cityName = 'There is an error.';
    // svgBG = SvgPicture.asset('images/404-error.svg');
    return;
  }
  var temp = weatherData['main']['temp'];
  temperature = temp.toInt();
  temperatureFahrenheit = ((temperature * 1.8) + 32).toInt();
  tempDisplay = temperature.toString();
  tempDisplayFahrenheit = tempDisplayFahrenheit.toString();
  var condition = weatherData['weather'][0]['id'];
  weatherPNG = weather.getWeatherPNGNetwork(condition);
  //cityName = weatherData['name'];
}

class WeatherModel {
  static const apiKey = 'da65a29869521910526be4537007df13';
  static const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getLocationWeather() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    NetworkHelper networkHelper = NetworkHelper(
        url:
        '$openWeatherMapURL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherPNGNetwork(int condition) {
    if (condition >= 200 || condition < 300) return 'http://openweathermap.org/img/wn/11d@2x.png';
    else if (condition >= 300 || condition < 400) return 'http://openweathermap.org/img/wn/09d@2x.png';
    else if (condition >= 400 || condition < 600) return 'http://openweathermap.org/img/wn/10d@2x.png';
    else if (condition >= 600 || condition < 700) return 'http://openweathermap.org/img/wn/13d@2x.png';
    else if (condition >= 700 || condition < 800) return 'http://openweathermap.org/img/wn/50d@2x.png';
    else if (condition == 800) return 'http://openweathermap.org/img/wn/01d@2x.png';
    else if (condition > 800 || condition <= 804) return 'http://openweathermap.org/img/wn/02d@2x.png';
    else return 'http://openweathermap.org/img/wn/03d@2x.png';
  }

}

class NetworkHelper {
  NetworkHelper({required this.url});

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('error');
      // var logger = Logger();
      // logger.e('Response Code: ${response.statusCode}');
    }
  }
}
