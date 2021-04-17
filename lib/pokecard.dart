import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pokedexv2/pokemons.dart';
import 'package:pokedexv2/data_pokemon.dart';
import 'package:pokedexv2/pokemon.dart';
import 'package:pokedexv2/detailpoke.dart';

class PokeCard extends StatefulWidget {
  const PokeCard({Key key, this.pokeURL}) : super(key: key);
  final String pokeURL;

  @override
  _PokeCardState createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  Pokemon pokemon;

  _fetchData() async {
    final response = await http.get(widget.pokeURL);
    final decode = json.decode(response.body);
    final data = Pokemon.fromJson(decode);

    setState(() {
      pokemon = data;
    });
  }

  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: _setColor(pokemon),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => DetailPage(pokemon)));
            },
            child: pokemon == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('#0${pokemon.id.toString()}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                      Image.network(
                        pokemon.sprites.frontDefault,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        pokemon.name,
                        style: TextStyle(
                            fontFamily: "PokeGoTypes",
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )
                    ],
                  ),
          )),
    );
  }
}

_setColor(Pokemon pokemon) {
  Color defaultColor = Colors.blueGrey;
  Color blue = Color(0xFF2A9CE0);
  Color lightblue = Color(0xFF3FB8B8);
  Color red = Color(0xB3FF6F6F);
  Color green = Color(0xB383FF74);
  Color grey = Color(0xB3485C54);
  Color purple = Color(0xB3D32BDC);
  Color yellow = Color(0xB3FCBC3A);
  Color earth = Colors.brown;
  Color fairy = Color(0xCBE872A7);
  Color orange = Color(0xCBEA740A);
  Color brownDark = Color(0xCB44372D);
  Color greyDark = Color(0xCB474545);
  Color dragon = Color(0xCBAD084E);
  Color pokeColor;

  if (pokemon != null) {
    for (int i = 0; i < pokemon.types.length; i++) {
      if (pokemon.types[i].type.name == "water") {
        pokeColor = blue;
      }
      if (pokemon.types[i].type.name == "fire") {
        pokeColor = red;
      }
      if (pokemon.types[i].type.name == "grass") {
        pokeColor = green;
      }
      if (pokemon.types[i].type.name == "bug") {
        pokeColor = yellow;
      }
      if (pokemon.types[i].type.name == "normal") {
        pokeColor = grey;
      }
      if (pokemon.types[i].type.name == "poison") {
        pokeColor = purple;
      }
      if (pokemon.types[i].type.name == "electric") {
        pokeColor = lightblue;
      }
      if (pokemon.types[i].type.name == "ground") {
        pokeColor = earth;
      }
      if (pokemon.types[i].type.name == "fairy") {
        pokeColor = fairy;
      }
      if (pokemon.types[i].type.name == "fighting") {
        pokeColor = orange;
      }
      if (pokemon.types[i].type.name == "psychic") {
        pokeColor = brownDark;
      }
      if (pokemon.types[i].type.name == "rock") {
        pokeColor = greyDark;
      }
      if (pokemon.types[i].type.name == "ghost") {
        pokeColor = purple;
      }
      if (pokemon.types[i].type.name == "ice") {
        pokeColor = blue;
      }
      if (pokemon.types[i].type.name == "dragon") {
        pokeColor = dragon;
      }

      return pokeColor;
    }
  }
  return defaultColor;
}
