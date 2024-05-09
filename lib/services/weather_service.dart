import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService
{
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '6834793d715c443b887182230240104';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        //baseUrl http://api.weatherapi.com/v1 in case is domain changed
        //apiKey 6834793d715c443b887182230240104
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      //carrying the data
      WeatherModel weathermodel = WeatherModel.fromJson(response.data);
      return weathermodel;
    } on DioException catch(e) {
      String errorMessage = e.response?.data['error']['message'] ?? 'oops dio error!';
      throw Exception(errorMessage);
    } catch(e) {
      throw Exception('oops error!');
    }

  }

}