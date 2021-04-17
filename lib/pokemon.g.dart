// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map json) {
  return Pokemon(
    id: json['id'] as int,
    name: json['name'] as String,
    species: json['species'] == null
        ? null
        : Species.fromJson((json['species'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    sprites: json['sprites'] == null
        ? null
        : Sprites.fromJson((json['sprites'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    stats: (json['stats'] as List)
        ?.map((e) => e == null
            ? null
            : Stat.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    types: (json['types'] as List)
        ?.map((e) => e == null
            ? null
            : Type.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    forms: (json['forms'] as List)
        ?.map((e) => e == null
            ? null
            : Species.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    weight: json['weight'] as int,
    base_experience: json['base_experience'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'stats': instance.stats?.map((e) => e?.toJson())?.toList(),
      'types': instance.types?.map((e) => e?.toJson())?.toList(),
      'forms': instance.forms?.map((e) => e?.toJson())?.toList(),
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'base_experience': instance.base_experience,
      'species': instance.species?.toJson(),
      'sprites': instance.sprites?.toJson(),
    };
