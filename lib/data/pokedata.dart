import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Pokedata {
  Future<List> pokemones() async {
    List pokemones = [];

    var url =
        Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

      for (var item in jsonData["results"]) {
        pokemones.add(item["name"]);
      }

      return pokemones;
    } else {
      throw Exception("fallo la conexion");
    }
  }

  List<Widget> pokeNames(data) {
    List<Widget> pokes = [];

    for (var item in data) {
      pokes.add(Text(item));
    }

    return pokes;
  }
}
