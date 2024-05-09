import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/weather_model.dart';
import '../../services/weather_service.dart';
import 'get_weather state.dart';
// 3- create function step
//a class extends cubit so it become cubit and manage all states
class GetWeatherCubit extends Cubit<weatherState> {
  GetWeatherCubit() : super(NoWeatherState());
 // late WeatherModel weatherModel;
  //inital state--> when the app first started
   WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
  WeatherModel weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      //like an observer link cubit with states of the app

      emit(WeatherLoadedState(weatherModel));
    } catch (error) {
      emit(WeatherFailureState());
    }
  }
}
