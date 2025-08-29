// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:pokedex/model/pokemon_model.dart';

class PokeApi{
  static const String _baseUrl = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> fetchPokemonData() async {
    List<PokemonModel> _pokemonList = [];
    final dio = Dio();
    final response = await dio.get(_baseUrl);
    final pokeList = json.decode(response.data)['pokemon'];

    if (pokeList is List) {
      _pokemonList = pokeList.map((e) => PokemonModel.fromMap(e)).toList();
      debugPrint('Pokémon data fetched successfully: ${_pokemonList.length} Pokémon found.');
      return _pokemonList;

    } else {
      throw Exception('Failed to load Pokémon data');
    }
  }
}