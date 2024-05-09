import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather%20state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

import '../widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return SearchView();

              }
              )
              );
            },

            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      //integrate bloc with ui
      //listen to everyy changee
      body: BlocBuilder<GetWeatherCubit,weatherState>(
      builder:(context,state){
        if (state is NoWeatherState)
        {
          return NoWeatherBody();
        }
        else if(state is WeatherLoadedState)
          {
            return WeatherInfoBody(weatherModel:state.weatherModel);
          }
        else
          return Text('There was an error!!');

    },
    ),
    );

  }
}

