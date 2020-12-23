import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weathe_bloc_test/bloc/weather/weather_bloc.dart';
import 'package:weathe_bloc_test/helper/my_helper.dart';
import 'package:weathe_bloc_test/ui/search_area.dart';

class WeatherHome extends StatefulWidget {
  final int cityCode;
  WeatherHome([this.cityCode = 1015662]) : assert(cityCode != null);
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  final newFormat = DateFormat("dd/MM/yy H:m:s");
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    weatherBloc..add(FetchWeatherEvent(cityCode: widget.cityCode));
    print(widget.cityCode);
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        leading: Icon(Icons.home),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchArea(),
                ),
              );
            },
            tooltip: 'Search City',
          ),
        ],
      ),
      body: Container(
        padding:
            EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is LoadingWeatherState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ErrorWeatherState) {
              return Center(
                child: Text('Error loading from API'),
              );
            }
            if (state is LoadedWeatherState) {
              return ListView(
                children: [
                  Column(
                    children: [
                      Text(
                        "${state.weathersModel.title}",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                          textStyle: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Text("updated: " +
                          newFormat
                              .format(DateTime.parse(
                                  state.weathersModel.weathers[0].created))
                              .toString()),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Image(
                          width: 150.0,
                          image: AssetImage(
                              "assets/images/${MyHelper.mapStringToImage(state.weathersModel.weathers[0].weatherStateAbbr)}.png"),
                        ),
                      ),
                      Text(
                        '${state.weathersModel.weathers[0].weatherStateName}',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          textStyle: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${state.weathersModel.weathers[0].theTemp.toInt()}°C ",
                              style: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.headline3,
                                color: Colors.red,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                    '${state.weathersModel.weathers[0].minTemp.toInt()}°C'),
                                Text(
                                    '${state.weathersModel.weathers[0].maxTemp.toInt()}°C'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
            return Center(
              child: Text('Null'),
            );
          },
        ),
      ),
    );
  }
}
