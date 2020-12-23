import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weathe_bloc_test/bloc/search/search_bloc.dart';
import 'package:weathe_bloc_test/bloc/weather/weather_bloc.dart';
import 'package:weathe_bloc_test/network/api_service.dart';
import 'package:weathe_bloc_test/ui/weather_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context) => ApiService.create(),
      child: Consumer<ApiService>(
        builder: (context, apiservice, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<WeatherBloc>(
                create: (context) => WeatherBloc(api: apiservice),
              ),
              BlocProvider<SearchBloc>(
                create: (context) => SearchBloc(api: apiservice),
              ),
            ],
            child: MaterialApp(
              title: 'Weather App',
              theme: ThemeData(
                primaryColor: Colors.red,
              ),
              home: WeatherHome(),
            ),
          );
        },
      ),
    );
  }
}
