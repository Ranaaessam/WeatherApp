import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search City'),  backgroundColor: Colors.deepOrange,),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18 ),
        child: Center(
          child: TextField(
            // onChanged: (){
            //
            // },
            onSubmitted: (value) async{
              //triggering the cubit
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);

                  Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: 'Enter a city',
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),

              ),
            ),
          ),
        ),
      )


    );
  }
}
