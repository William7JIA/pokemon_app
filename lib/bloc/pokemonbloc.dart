import 'package:pokemon/bloc/pokemenevent.dart';
import 'package:pokemon/bloc/pokemonstate.dart';
import 'package:pokemon/bloc/pokemonrepository';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends bloc<PokemonEvent, PokemenState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial());

  @Override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPage) {
      yield PokemonLoadInProgress();

      try {
        final pokemonPage = await _pokemonRepository.getPokemonPage(event.page);
        yield PokemonPageLoadSuccess(
            pokemonListings: pokemonPage.pokemonListings,
            canLoadNextPage: pokemonPage.canLoadNextPage);
      } catch (e) {
        yield PokemonPageLoadFailed(error: e);
      }
    }
  }
}
