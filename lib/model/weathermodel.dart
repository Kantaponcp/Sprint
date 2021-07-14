import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

WeatherModel weather = WeatherModel();

class WeatherModel {
  int temperature=0;
  String tempDisplay='';
  String cityName='';
  String weatherMessage='';
  double newHeight=0;
  String weatherSVG = '';
  late SvgPicture svgBG;
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

  void updateUI(dynamic weatherData) {

    if (weatherData == null) {
      //temperature = 0;
      tempDisplay = '--';
      weatherSVG = 'https://www.flaticon.com/svg/static/icons/svg/2471/2471920.svg';
      //cityName = 'There is an error.';
      svgBG = SvgPicture.asset('images/404-error.svg');
      return;
    }
    var temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    tempDisplay = temperature.toStringAsFixed(2);
    var condition = weatherData['weather'][0]['id'];
    weatherSVG = weather.getWeatherSVGNetwork(condition);
    //cityName = weatherData['name'];

  }

  String getWeatherSVGNetwork(int condition) {
    if (condition >= 200 || condition < 300) return 'https://www.flaticon.com/svg/static/icons/svg/3026/3026385.svg';
    else if (condition >= 300 || condition < 400) return 'https://www.flaticon.com/svg/static/icons/svg/899/899693.svg';
    else if (condition >= 400 || condition < 600) return 'https://www.flaticon.com/svg/static/icons/svg/2921/2921803.svg';
    else if (condition >= 600 || condition < 700) return 'https://www.flaticon.com/svg/static/icons/svg/2834/2834554.svg';
    else if (condition >= 700 || condition < 800) return 'https://www.flaticon.com/svg/static/icons/svg/2446/2446001.svg';
    else if (condition == 800) return 'https://www.flaticon.com/svg/static/icons/svg/146/146199.svg';
    else if (condition > 800 || condition <= 804) return 'https://www.flaticon.com/svg/static/icons/svg/899/899681.svg';
    else return 'https://www.flaticon.com/svg/static/icons/svg/2471/2471920.svg';
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
