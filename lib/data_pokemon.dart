import 'package:json_annotation/json_annotation.dart';
import 'package:pokedexv2/pokemon.dart';
import 'dart:convert';
part 'data_pokemon.g.dart';

@JsonSerializable(explicitToJson: true)
class DataPokemon {
  const DataPokemon({this.name, this.url});

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  factory DataPokemon.fromJson(Map<String, dynamic> json) =>
      _$DataPokemonFromJson(json);

  Map<String, dynamic> toJson() => _$DataPokemonToJson(this);
}

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));
