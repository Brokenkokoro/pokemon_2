import 'package:flutter/material.dart';
import 'package:pokemon_2/views/mational_pokemon.dart';
import 'package:pokemon_2/views/regional_pokemon.dart';

class Pokemon extends StatefulWidget {
  final List data;
  const Pokemon(this.data, {Key? key}) : super(key: key);

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  var _actualPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _actualPokedex = [
      NationalPokemon(widget.data),
      RegionalPokemon(widget.data)
    ];
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.data[8])),
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
