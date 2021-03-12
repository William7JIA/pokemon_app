import 'package:pokemon/bloc/pokemonbloc.dart';
import 'package:pokemon/bloc/pokemonevent.dart';
import 'package:pokemon/pokedex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
          primaryColor: Colors.lightBlue, accentColor: Colors.lightBlue),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) => PokemonBloc()..add(PokemonPage(page: 0)))
      ], child: PokedexView()),
    );
  }
}
