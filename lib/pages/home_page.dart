import 'package:flutter/material.dart';
import 'package:pokedex/widget/custom_app_title.dart';
import 'package:pokedex/widget/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            children: [
              AppTitle(),
              Expanded(child: PokemonList()),
            ],
          );
        },
      ),
    );
  }
}
