import 'package:day16_pokedex_app/pokemonpage.dart';
import 'package:flutter/material.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<PokemonList> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess(
      {@required this.pokemonListing, @required this.canLoadNextPage});
}

class PokemonPageLoadFailed extends PokemonState {
  final Error error;

  PokemonPageLoadFailed({@required this.error});
}
