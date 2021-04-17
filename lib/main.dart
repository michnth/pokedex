import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedexv2/pokecard.dart';
import 'package:pokedexv2/pokemons.dart';

void main() => runApp(MaterialApp(
      title: "Pokedex App",
      home: HomePage(),
      theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.redAccent),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  static const String url =
      'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Pokemons pokemons;

  Color bgColor = Colors.white;
  Future<List<Pokemons>> _fetchData() async {
    final response = await http.get(HomePage.url);
    final decode = json.decode(response.body);
    final data = Pokemons.fromJson(decode['results']);
    print(data.pokemons);

    setState(() {
      pokemons = data;
    });
  }

  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Pokedex APP",
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search Pokemon",
              onPressed: () {
                showSearch(context: context, delegate: DataSearch(pokemons));
              })
        ],
      ),
      body: Container(
        child: pokemons == null
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              )
            : GridView.count(
                crossAxisCount: 1,
                children: List.generate(
                    pokemons.pokemons.length,
                    (index) => PokeCard(
                          pokeURL: pokemons.pokemons[index].url,
                        )),
              ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  Pokemons _pokemons;

  DataSearch(this._pokemons);

  final all = [
    'mew',
    'mewtwo',
    'dragonite',
    'dragonair',
    'moltres',
    '',
  ];

  final recent = [
    'mew',
    'mewtwo',
    'dragonite',
  ];
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: theme.primaryColor,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: query.isEmpty ? 3 : _pokemons.pokemons.length,
        itemBuilder: (context, index) =>
            _pokemons.pokemons[index].name.contains(query)
                ? ListTile(
                    title: PokeCard(
                    pokeURL: _pokemons.pokemons[index].url,
                  ))
                : Row(
                    children: [],
                  ));
  }
}

class getBase {
  String name;
  String url;

  getBase({
    this.name,
    this.url,
  });

  Map<String, dynamic> toJson() => {"name": name, "url": url};

  factory getBase.fromJson(Map<String, dynamic> json) {
    return getBase(
      name: json["name"],
      url: json["url"],
    );
  }
}
