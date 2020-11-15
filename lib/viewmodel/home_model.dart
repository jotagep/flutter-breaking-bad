import 'package:flutter_breaking_bad/enum/viewstate.dart';
import 'package:flutter_breaking_bad/locator.dart';
import 'package:flutter_breaking_bad/models/Personaje.dart';
import 'package:flutter_breaking_bad/services/api.dart';
import 'package:flutter_breaking_bad/viewmodel/base_model.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Personaje> _personajes;

  HomeModel() {
    _getPersonajes();
  }

  List<Personaje> get personajes => _personajes;

  Future _getPersonajes() async {
    setState(ViewState.Busy);
    _personajes = await _api.getPersonajes();
    setState(ViewState.Idle);
  }
}
