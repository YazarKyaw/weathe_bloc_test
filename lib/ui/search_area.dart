import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weathe_bloc_test/bloc/search/search_bloc.dart';
import 'package:weathe_bloc_test/bloc/weather/weather_bloc.dart';
import 'package:weathe_bloc_test/ui/weather_home.dart';

class SearchArea extends StatefulWidget {
  @override
  _SearchAreaState createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextFormField(
                      autofocus: true,
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Search City',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    if (_searchController.text != null) {
                      searchBloc
                        ..add(FetchCityEvent(cityName: _searchController.text));
                    }
                  },
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is EmptyWeatherState) {
                    return Center(
                      child: Text('Type something to search'),
                    );
                  }
                  if (state is CityLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CityLoadedState) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WeatherHome(),
                              ),
                            );
                          },
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 15.0,
                                  bottom: 15.0,
                                  left: 10.0,
                                  right: 10.0),
                              child: Text(
                                "${state.cityModels[index].title}",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  textStyle:
                                      Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: state.cityModels.length,
                    );
                  }
                  if (state is ErrorCityState) {
                    return Center(
                      child: Text('${state.error}'),
                    );
                  }

                  return Center(
                    child: Text('Null'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
