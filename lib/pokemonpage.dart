import 'package:flutter/foundation.dart';
/*
count:1118
next:"https://pokeapi.co/api/v2/pokemon?offset=300&limit=100"
previous:"https://pokeapi.co/api/v2/pokemon?offset=100&limit=100"
result: {name:"unown"
  url:"https://pokeapi.co/api/v2/pokemon/201/"  
  name:"wobbuffet"
  url:"https://pokeapi.co/api/v2/pokemon/202/"
]
*/

class PokemonList {
  final int id;
  final String name;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  PokemonList({@required this.id, @required this.name});

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonList(id: id, name: name);
  }
}

class PokemonPage{
  final List<PokemonList> pokemonListings;
  final bool canLoadNextPage;

  PokemonPage(
    {@required this.pokemonListings, @required this.canLoadNextPage});
  
  factory PokemonPage.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonListings = (json['result'] as List)
          .map((listingJson)) => PokemonList.fromJson(listingJson)
          .toList();
    
    return PokemonPage(
      pokemonListings: pokemonListings, canLoadNextPage: canLoadNextPage);
  }
}
