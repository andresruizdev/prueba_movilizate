import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:prueba_movilizate/repository/random_number.dart';

class MovilizateBloc extends Bloc{
  RandomNumber randomNumber;
  MovilizateBloc(){
    randomNumber = RandomNumber();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}