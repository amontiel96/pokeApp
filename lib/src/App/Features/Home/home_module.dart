import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemon_detail.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemon_species.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemons.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_detail_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_species_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/pages/detail_page.dart';
import 'package:poke_app/src/App/Features/Home/presentation/pages/details.dart';

import 'package:poke_app/src/App/injection_container.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<PokemonCubit>(() => PokemonCubit(getPokemons: sl<PokemonApiService>()));
    i.addSingleton<PokemonDetailCubit>(() => PokemonDetailCubit(apiService: sl<PokemonDetailApiService>()));
    i.addSingleton<PokemonSpeciesCubit>(() => PokemonSpeciesCubit(apiService: sl<PokemonSpeciesApiService>()));
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => HomePage());
    r.child('/detail', child: (context) => DetailPage());
    r.child('/detail2', child: (context) => PokemonDetailsPage(pokemonId: 1,speciesId: 1,));
  }
}
