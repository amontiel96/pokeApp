import 'package:dartz/dartz.dart';
import 'package:poke_app/src/App/Core/errors/failures.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_model.dart';



abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonModel>>> getPokemons(String url);
}


/*abstract class PokemonRepository {
  Future<Either<Failure, DataPokemon>> getPokemons(String url);
}*/
