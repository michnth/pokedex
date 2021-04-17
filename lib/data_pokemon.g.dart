// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataPokemon _$DataPokemonFromJson(Map<String, dynamic> json) {
  return DataPokemon(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$DataPokemonToJson(DataPokemon instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
