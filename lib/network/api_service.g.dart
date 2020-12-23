// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://www.metaweather.com/api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<WeathersModel> getWeather(locationId) async {
    ArgumentError.checkNotNull(locationId, 'locationId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'location/$locationId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = WeathersModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<CityModel>> getCities(keyword) async {
    ArgumentError.checkNotNull(keyword, 'keyword');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': keyword};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('location/search/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => CityModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
