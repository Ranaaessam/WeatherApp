import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:weather_app/views/HomeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
    child:  MaterialApp(
      theme: ThemeData(
        primarySwatch: getThemeColor(
          BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition,
        ),
      ),
      home: const HomeView(),
    ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  switch (condition?.toLowerCase()) {
    case "sunny":
      return Colors.yellow;
    case "partly cloudy":
      return Colors.orange;
    case "cloudy":
      return Colors.grey;
    case "overcast":
      return Colors.blueGrey;
    case "mist":
    case "patchy rain possible":
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
    case "thundery outbreaks possible":
      return Colors.lightBlue;
    case "blowing snow":
    case "blizzard":
    case "fog":
    case "freezing fog":
    case "patchy light drizzle":
    case "light drizzle":
    case "freezing drizzle":
    case "heavy freezing drizzle":
      return Colors.teal;
    default:
      return Colors.blue; // Default color for unknown weather descriptions
  }
}
