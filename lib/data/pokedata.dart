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

  Future<List> pokeurl() async {
    List pokeurl = [];

    var url =
        Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

      for (var item in jsonData["results"]) {
        pokeurl.add(item["url"]);
      }

      return pokeurl;
    } else {
      throw Exception("fallo la conexion");
    }
  }

  Future<List> pokedata(pokeurl, index) async {
    var url = pokeurl[index];
    var url2 = Uri.parse(url);
    final response = await http.get(url2);

    List data = [];

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

      data.add(jsonData["abilities"][0]["ability"]["name"]); //1
      if (jsonData["abilities"].length > 1) {
        data.add(jsonData["abilities"][1]["ability"]["name"]); //2
      } else {
        data.add("");
      }
      data.add((index + 1)); //3
      data.add(jsonData["height"]); //4
      data.add(jsonData["moves"][0]["move"]["name"]); //5
      data.add(jsonData["moves"][1]["move"]["name"]); //6
      data.add(jsonData["moves"][2]["move"]["name"]); //7
      data.add(jsonData["moves"][3]["move"]["name"]); //8
      data.add(jsonData["name"]); //9
      data.add(jsonData["stats"][0]["base_stat"]); //10
      data.add(jsonData["stats"][1]["base_stat"]); //11
      data.add(jsonData["stats"][2]["base_stat"]); //12
      data.add(jsonData["stats"][3]["base_stat"]); //13
      data.add(jsonData["stats"][4]["base_stat"]); //14
      data.add(jsonData["stats"][5]["base_stat"]); //15
      data.add(jsonData["types"][0]["type"]["name"]); //16
      if (jsonData["types"].length > 1) {
        data.add(jsonData["types"][1]["type"]["name"]); //17
      } else {
        data.add("");
      }
      data.add(jsonData["weight"]); //18
      data.add(jsonData["sprites"]["front_default"]); //19
    } else {
      throw Exception("fallo la conexion");
    }
    return data;
  }

  List<Widget> pokeNames(data) {
    List<Widget> pokes = [];

    for (var item in data) {
      pokes.add(Text(item));
    }

    return pokes;
  }
}
