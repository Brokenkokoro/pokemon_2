import 'package:flutter/material.dart';
import 'package:pokemon_2/data/pokedata.dart';
import 'package:pokemon_2/views/pokemon.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<List> _pokeName = Pokedata().pokemones();
  final Future<List> _pokeUrl = Pokedata().pokeurl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Pokedex")),
      ),
      body: FutureBuilder(
          future: _pokeName,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: Pokedata().pokeNames(snapshot.data).length,
                itemBuilder: (context, index) {
                  List _pokes = Pokedata().pokeNames(snapshot.data);
                  return ListTile(
                    title: _pokes.elementAt(index),
                    leading: Text((index + 1).toString()),
                    trailing: const Icon(Icons.catching_pokemon),
                    iconColor: Colors.red,
                    onTap: () async {
                      List _url = await _pokeUrl;
                      List data = await Pokedata().pokedata(_url, index);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  Pokemon(data))));
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Text("error");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
