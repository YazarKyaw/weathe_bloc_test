import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props =>
      [weatherStateName, weatherStateAbbr, created, minTemp, maxTemp, theTemp];
  @JsonKey(name: 'weather_state_name')
  final String weatherStateName;
  @JsonKey(name: 'weather_state_abbr')
  final String weatherStateAbbr;

  final String created;
  @JsonKey(name: 'min_temp')
  final double minTemp;
  @JsonKey(name: 'max_temp')
  final double maxTemp;
  @JsonKey(name: 'the_temp')
  final double theTemp;

  WeatherModel({
    this.weatherStateName,
    this.weatherStateAbbr,
    this.created,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
