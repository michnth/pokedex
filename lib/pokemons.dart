import 'package:pokedexv2/data_pokemon.dart';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Pokemons {
  List<DataPokemon> pokemons = [];

  Pokemons.fromJson(List<dynamic> json) {
    if (json == null) return;

    json.forEach((item) {
      final pokemon = DataPokemon.fromJson(item);
      pokemons.add(pokemon);
    });
  }
}
