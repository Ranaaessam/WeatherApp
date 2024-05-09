//1- create states -> cases of our ui
import 'package:weather_app/models/weather_model.dart';

class weatherState{}
class NoWeatherState extends weatherState{}

class WeatherLoadedState extends weatherState {
  //to have an object of the weather model class
  //access info from inside the cubit
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends weatherState{}
