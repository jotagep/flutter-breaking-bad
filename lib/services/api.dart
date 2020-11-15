import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_breaking_bad/models/Personaje.dart';

class Api {
  static const endpoint = "https://www.breakingbadapi.com/api";
  var client = new http.Client();

  Future<List<Personaje>> getPersonajes() async {
    var personajesList = List<Personaje>();

    var response = await client.get('$endpoint/characters');

    var parsedJson = json.decode(response.body) as List<dynamic>;

    for (var personaje in parsedJson) {
      personajesList.add(Personaje.fromJson(personaje));
    }

    return personajesList;
  }
}
