part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object> get props => [];
}

class EmptyWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final WeathersModel weathersModel;
  LoadedWeatherState({@required this.weathersModel})
      : assert(weathersModel != null);
  @override
  List<Object> get props => [weathersModel];
}

class ErrorWeatherState extends WeatherState {}
