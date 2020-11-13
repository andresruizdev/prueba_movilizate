import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:prueba_movilizate/bloc/movilizate_bloc.dart';
import 'package:prueba_movilizate/ui/widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movilizateBloc = BlocProvider.of<MovilizateBloc>(context);

    var searchButton = Expanded(
        flex: 1,
        child: Center(
          child: RaisedButton(
            onPressed: () {
              movilizateBloc.randomNumber.getRandomNumbers();
            },
            child: Text('Buscar'),
            color: Color.fromRGBO(105, 190, 50, 1.0),
          ),
        ));

    var searchInMapButton = Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        child: FlatButton(
          color: Colors.grey,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.map),
              Padding(padding: EdgeInsets.all(15)),
              Text('Use the map')
            ],
          ),
        ),
      ),
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Movilizate'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
                child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(children: [
                    SearchBar(Colors.red, Icon(Icons.location_city)),
                    SearchBar(Colors.pink, Icon(Icons.location_disabled)),
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      searchButton,
                      searchInMapButton,
                    ],
                  ),
                )
              ],
            )),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: ValueListenableBuilder(
                valueListenable: movilizateBloc.randomNumber.randomNumbers,
                builder: (BuildContext context, dynamic value, Widget child) {
                  return ListView.builder(
                    itemCount:
                        movilizateBloc.randomNumber.randomNumbers.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Container(
                          height: 75,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(movilizateBloc.randomNumber.containsCousinNumber(movilizateBloc
                                    .randomNumber.randomNumbers.value[index]) ? Icons.check : Icons.error),
                                    Padding(padding: EdgeInsets.only(left: 30)),
                                Text(movilizateBloc
                                    .randomNumber.randomNumbers.value[index]),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
