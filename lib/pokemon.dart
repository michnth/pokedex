import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class Pokemon {
  const Pokemon({
    this.id,
    this.name,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.forms,
    this.weight,
    this.base_experience,
    this.height,
  });
  final List<Stat> stats;
  final List<Type> types;
  final List<Species> forms;

  final int id;

  final String name;

  final int weight;

  final int height;

  final int base_experience;

  final Species species;

  final Sprites sprites;

  static Map colorsTemplate = {
    'bug': Color.fromARGB(255, 198, 209, 110),
    'dark': Color.fromARGB(255, 162, 146, 136),
    'dragon': Color.fromARGB(255, 162, 125, 250),
    'electric': Color.fromARGB(255, 250, 224, 120),
    'fairy': Color.fromARGB(255, 244, 189, 201),
    'fighting': Color.fromARGB(255, 214, 120, 115),
    'fire': Color.fromARGB(255, 245, 172, 120),
    'flying': Color.fromARGB(255, 198, 183, 245),
    'ghost': Color.fromARGB(255, 162, 146, 188),
    'grass': Color.fromARGB(255, 167, 219, 141),
    'ground': Color.fromARGB(255, 235, 214, 157),
    'ice': Color.fromARGB(255, 188, 230, 230),
    'normal': Color.fromARGB(255, 198, 198, 167),
    'poison': Color.fromARGB(255, 193, 131, 193),
    'psychic': Color.fromARGB(255, 250, 146, 178),
    'rock': Color.fromARGB(255, 209, 193, 125),
    'steel': Color.fromARGB(255, 209, 209, 224),
    'water': Color.fromARGB(255, 157, 183, 245),
  };

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

class Sprites {
  String frontDefault;

  Sprites({
    this.frontDefault,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}

class Stat {
  int baseStat;
  int effort;
  Species stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

class Type {
  int slot;
  Species type;

  Type({
    this.slot,
    this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}

class Species {
  String name;
  String url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
