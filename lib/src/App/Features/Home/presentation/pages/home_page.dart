import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_cubit.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final PokemonCubit _cubit = Modular.get<PokemonCubit>();

  @override
  void initState() {
    _cubit.fetchPokemons(
      'https://pokeapi.co/api/v2/pokemon/',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UIBaseScreen(
      appBarTitleWidget: UILabel(
        text: AppConstants.home.title,
        fontSize: UISpacing.spacingL_24,
        textColor: UIColorPalette.primaryColorLetter,
      ),
      header: Row(
        children: [
          SizedBox(
            height: 40,
            width: 300,
            child: UIInputSearch(
              enabled: true,
              autofocus: false,
              //controller: TextEditingController(),
              onChanged: (value) {},
              hint: AppConstants.home.search,
            ),
          ),
          Spacer(),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ],
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is PokemonLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PokemonError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is PokemonLoaded) {
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollEndNotification &&
                    scrollNotification.metrics.pixels ==
                        scrollNotification.metrics.maxScrollExtent) {
                  // Cargar más Pokémon cuando se llega al final
                  if (state.nextUrl.isNotEmpty) {
                    _cubit.loadMorePokemons(
                      state.nextUrl,
                    );
                  }
                }
                return false;
              },
              child: SizedBox(
                width: double.infinity,
                height: 500,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    mainAxisExtent: 120,
                  ),
                  itemCount: state.pokemons.length,
                  itemBuilder: (context, index) {
                    final pokemon = state.pokemons[index];
                    return InkWell(
                      onTap: () {
                        Modular.to.pushNamed('/detail');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Texto alineado a la derecha en la parte superior
                            Padding(
                              padding: EdgeInsets.only(right: 8, top: 5),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '#${index + 1}',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            // Stack para superponer la imagen sobre el contenedor gris
                            Spacer(),
                            Stack(
                              clipBehavior: Clip.none,
                              // Permite que la imagen sobresalga
                              children: [
                                // Fondo gris (subfondo) que ocupa toda la parte inferior
                                Container(
                                  width: double.infinity,
                                  height: 60,
                                  // Ajusta el tamaño del fondo gris para que ocupe más espacio
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // Alineamos el texto al fondo
                                    children: [
                                      // Texto centrado en la parte inferior
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        child: Text(
                                          pokemon.name,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Imagen centrada y más grande, posicionada encima del fondo gris
                                Positioned(
                                  top: -60,
                                  // Posicionamos la imagen hacia arriba para que sobresalga
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 100,
                                    width: 100, // Tamaño de la imagen
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );

                    //este funciona
                    /*Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(pokemon.name, style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    );*/
                  },
                ),
              ),
            );
          }
          return Center(child: Text('No Pokemons found.'));
        },
      ),
    );
  }
}
