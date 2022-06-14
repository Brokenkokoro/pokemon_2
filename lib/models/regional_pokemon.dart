import 'package:flutter/material.dart';

class RegionalPokemon extends StatelessWidget {
  final List data;
  const RegionalPokemon(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(data[5]),
        ),
      ),
    );
  }
}
