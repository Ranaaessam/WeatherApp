//first thing to do
class WeatherModel{
  final String cityName;
  final String date;
  final String? img;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherCondition;

  WeatherModel(
      {
        //check the data types
        required this.cityName,
        required this.date,
         this.img,
        required this.temp,
        required this.maxtemp,
        required this.mintemp,
        required this.weatherCondition});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        date: json['current']['last_updated'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp:json['forecast']['forecastday'][0]['day']['mintemp_c'] ,
        img: json['forecast']['forecastday'][0]['day']['condition']['icon'],

    weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text']
    );
  }





}