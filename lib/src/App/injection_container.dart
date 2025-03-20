import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/src/App/Features/Home/data/datasources/pokemon_remote_datasource.dart';

import 'package:poke_app/src/App/Features/Home/data/repositories/pokemon_repository_impl.dart';

import 'package:poke_app/src/App/Features/Home/domain/repositories/pokemon_repository.dart';

import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemons.dart';

import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_cubit.dart';

final sl = GetIt.instance;

void init() {
  //inyector global de toda la app
  // Registrar el cliente HTTP
  sl.registerLazySingleton<http.Client>(() => http.Client());

  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(client: sl()),
  );

  // Repositories
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(remoteDataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<PokemonApiService>(
    () => PokemonApiService(client: sl()),
  );

  // Cubit
  sl.registerFactory(() => PokemonCubit(getPokemons: sl()));
}
