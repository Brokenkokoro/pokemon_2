import 'package:flutter/material.dart';

class NationalPokemon extends StatelessWidget {
  final List data;
  const NationalPokemon(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              boxShadow: const [BoxShadow(offset: Offset(3, 3))],
              border: Border.all(),
              borderRadius: BorderRadius.circular(5.0)),
          padding: const EdgeInsets.all(2.0),
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(child: Image.network(data[18], fit: BoxFit.fill)),
              const Text('hola')
            ],
          ),
        ),
      ),
    );
  }
}
