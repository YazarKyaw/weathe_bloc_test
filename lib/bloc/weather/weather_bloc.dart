import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weathe_bloc_test/network/api_service.dart';
import 'package:weathe_bloc_test/network/model/weather_model.dart';
import 'package:weathe_bloc_test/network/model/weathers_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({@required this.api})
      : assert(api != null),
        super(EmptyWeatherState());
  final ApiService api;

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeatherEvent) {
      yield LoadingWeatherState();
      try {
        final response = await api.getWeather(event.cityCode);
        yield LoadedWeatherState(weathersModel: response);
      } on SocketException {
        yield ErrorWeatherState();
      } on Exception {
        yield ErrorWeatherState();
      }
    }
  }
  // TODO: implement mapEventToState
}
