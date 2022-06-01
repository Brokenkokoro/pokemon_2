import 'package:flutter/material.dart';
import 'package:pokemon_2/models/mational_pokemon.dart';
import 'package:pokemon_2/models/regional_pokemon.dart';

class Pokemon extends StatefulWidget {
  const Pokemon({Key? key}) : super(key: key);

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  var _actualPage = 0;
  final List<Widget> _actualPokedex = [
    const NationalPokemon(),
    const RegionalPokemon()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: _actualPokedex[_actualPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _actualPage = index;
          });
        },
        currentIndex: _actualPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.catching_pokemon), label: "National"),
          BottomNavigationBarItem(
              icon: Icon(Icons.catching_pokemon_sharp), label: "Regional")
        ],
      ),
    );
  }
}
