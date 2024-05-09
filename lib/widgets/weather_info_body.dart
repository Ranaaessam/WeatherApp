import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherInfoBody({Key? key,required this.weatherModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get the weather model from the cubit to cutomize it as i like
    //passing the data
   // var weatherModel =  BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[50]!],
            begin: Alignment.topRight
            ,end:Alignment.bottomLeft )

      ,),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              weatherModel.date,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/cloudy.png',
                ),
                const Text(
                  '17',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      weatherModel.maxtemp.toString(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      weatherModel.mintemp.toString(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}