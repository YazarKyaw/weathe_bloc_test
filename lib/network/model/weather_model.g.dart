// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
    weatherStateName: json['weather_state_name'] as String,
    weatherStateAbbr: json['weather_state_abbr'] as String,
    created: json['created'] as String,
    minTemp: (json['min_temp'] as num)?.toDouble(),
    maxTemp: (json['max_temp'] as num)?.toDouble(),
    theTemp: (json['the_temp'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr': instance.weatherStateAbbr,
      'created': instance.created,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
    };
