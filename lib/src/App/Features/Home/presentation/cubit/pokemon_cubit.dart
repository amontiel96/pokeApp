import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_model.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemons.dart';




//primera version
class PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<PokemonModel> pokemons;
  final String nextUrl;

  PokemonLoaded({required this.pokemons, required this.nextUrl});
}

class PokemonError extends PokemonState {
  final String message;

  PokemonError({required this.message});
}


class PokemonCubit extends Cubit<PokemonState> {
  //final GetPokemons getPokemons;
  final PokemonApiService getPokemons;

  PokemonCubit({required this.getPokemons}) : super(PokemonLoading());

  Future<void> fetchPokemons(String url) async {
    final result = await getPokemons.getPokemons(url);

    result.fold(
          (failure) => emit(PokemonError(message: failure.message)),
          (response) {
        // response contiene la lista de pokemons y la siguiente URL para paginar
        emit(PokemonLoaded(pokemons: response.pokemons, nextUrl: response.nextUrl));
      },
    );
  }

  Future<void> loadMorePokemons(String nextUrl) async {
    final result = await getPokemons.getPokemons(nextUrl);

    result.fold(
          (failure) => emit(PokemonError(message: failure.message)),
          (response) {
        if (state is PokemonLoaded) {
          final currentState = state as PokemonLoaded;
          // Concatenar los nuevos Pokémon con los existentes
          emit(PokemonLoaded(
            pokemons: currentState.pokemons + response.pokemons,
            nextUrl: response.nextUrl, // Actualizar la URL para la siguiente carga
          ));
        }
      },
    );
  }
}