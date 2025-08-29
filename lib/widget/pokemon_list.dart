import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/services/pokedex_api.dart';
import 'package:pokedex/widget/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  Future<List<PokemonModel>>? _pokemonFuture;
  @override
  void initState() {
    super.initState();
    _pokemonFuture = PokeApi.fetchPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonFuture,
      builder: (context, snapshot) {
        var pokeList = snapshot.data ?? [];
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: pokeList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
            ),
            itemBuilder: (context, index) {
              var poke = pokeList[index];
              return PokelistItem(pokemon: poke);
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: [${snapshot.error}'));
        } else {
          return const Center(child: CircularProgressIndicator(color: Colors.white));
        }
      },
    );
  }
}
