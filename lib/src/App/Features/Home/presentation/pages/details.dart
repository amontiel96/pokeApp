import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_detail_cubit.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../cubit/pokemon_species_cubit.dart';

class PokemonDetailsPage extends StatelessWidget {
  final int pokemonId;
  final int speciesId;

  PokemonDetailsPage({required this.pokemonId, required this.speciesId});

  @override
  Widget build(BuildContext context) {
    final pokemonCubit =  Modular.get<PokemonDetailCubit>();
    final speciesCubit = Modular.get<PokemonSpeciesCubit>();

    // Cargar los detalles del Pokémon y de la especie
    pokemonCubit.fetchPokemonDetails(pokemonId);
    speciesCubit.fetchPokemonSpeciesDetails(speciesId);

    return Scaffold(
      appBar: AppBar(title: Text('Pokemon Details')),
      body: Column(
        children: [
          BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
            bloc: pokemonCubit,
            builder: (context, state) {
              if (state is PokemonLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PokemonError) {
                return Center(child: Text('Error: ${state.message}'));
              } else if (state is PokemonLoaded) {
                final pokemon = state.pokemon;
                pokemon.stats.forEach((item){

                });
                return Column(
                  children: [
                    Text('Name: ${pokemon.name}'),
                    Text('Height: ${pokemon.height / 10} m'),
                    Text('Weight: ${pokemon.weight / 10} kg'),
                    Text('Types: ${pokemon.types.join(', ')}'),
                    Text('Moves: ${pokemon.moves.join(', ')}'),
                    Text('Moves: ${pokemon.stats[0].name}'),
                    Text('Moves: ${pokemon.stats[0].baseStat}'),
                    
                  ],
                );
              }
              return Container();
            },
          ),
          BlocBuilder<PokemonSpeciesCubit, PokemonSpeciesState>(
            bloc: speciesCubit,
            builder: (context, state) {
              if (state is PokemonSpeciesLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PokemonSpeciesError) {
                return Center(child: Text('Error: ${state.message}'));
              } else if (state is PokemonSpeciesLoaded) {
                final species = state.species;
                return Column(
                  children: [
                    Text('Species: ${species.name}'),
                    Text('Flavor Text: ${species.flavorTexts.join(', ')}'),
                  ],
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
