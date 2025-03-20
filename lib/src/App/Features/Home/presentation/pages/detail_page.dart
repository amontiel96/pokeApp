import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_cubit.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../AtomicModel-UI/organisms/tdsm_backgroud.dart';
import '../../../../../AtomicModel-UI/organisms/tdsm_header.dart';
import '../../../../../AtomicModel-UI/organisms/tdsm_header_scaffold.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TDSMHeaderScaffold(
      backgroundType: TDSMBgType.medium,
      backgroundColor: Colors.white,
      showBottomBar: false,
      header: TDSMHeader.withTitle(
        key: const Key('detail'),
        title: 'Bolbasour',
        onActionPressed: () => Modular.to.pop(),
      ),
      heightBodyStart: 80,
      body: SingleChildScrollView(child: _body()),
    );
  }

  Widget _body() {
    return Column(
      spacing: 20,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  print("amsdev click before");
                },
                child: Icon(Icons.navigate_before, color: Colors.white),
              ),
              Spacer(),
              Image.network(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
                height: 300, // Puedes ajustar el tamaño de la imagen
                width: 300,
                fit:
                    BoxFit
                        .contain, // La imagen se ajustará sin perder proporciones
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  print("amsdev click next");
                },
                child: Icon(Icons.navigate_next, color: Colors.white),
              ),
            ],
          ),
        ),

        // Centrado de los Containers
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // Centramos los Containers en el Row
          children: [
            Container(
              height: 20,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.indigoAccent,
              ),
            ),
            SizedBox(width: 10), // Espacio entre los dos Containers
            Container(
              height: 20,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.indigoAccent,
              ),
            ),
          ],
        ),

        Center(child: Text('about')),

        // Separadores verticales (como un Divider vertical)
        Row(
          children: [
            Column(children: [Text('69 kg'), Text('Weigh')]),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Container(
                width: 1, // Un ancho de 1 para el divisor vertical
                height: 50, // Ajusta la altura del divisor vertical
                color: Colors.grey, // Color gris para el divisor
              ),
            ),
            Spacer(),
            Column(children: [Text('69 kg'), Text('Weigh')]),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Container(
                width: 1, // Un ancho de 1 para el divisor vertical
                height: 50, // Ajusta la altura del divisor vertical
                color: Colors.grey, // Color gris para el divisor
              ),
            ),
            Spacer(),
            Column(children: [Text('69 kg'), Text('Weigh')]),
          ],
        ),

        Text(
          'estrtas sada   sad    asddasd asda d asda sdas da sdas dasd   s dasdasdasdasdada sadad d',
        ),
        Center(child: Text('Base State')),

        Column(
          children: [
            Row(
              children: [
                Text('HP'),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    width: 1, // Un ancho de 1 para el divisor vertical
                    height: 50, // Ajusta la altura del divisor vertical
                    color: Colors.grey, // Color gris para el divisor
                  ),
                ),
                Text('045'),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Container(
                    width: 250,
                    height: 15,
                    child: StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 32,
                      size: 8,
                      padding: 0,
                      selectedColor: Colors.yellow,
                      unselectedColor: Colors.cyan,
                      roundedEdges: Radius.circular(10),
                      selectedGradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.green, Colors.green],
                      ),
                      unselectedGradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.greenAccent, Colors.greenAccent],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('HP'),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    width: 1, // Un ancho de 1 para el divisor vertical
                    height: 50, // Ajusta la altura del divisor vertical
                    color: Colors.grey, // Color gris para el divisor
                  ),
                ),
                Text('045'),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Container(
                    width: 250,
                    height: 15,
                    child: StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 32,
                      size: 8,
                      padding: 0,
                      selectedColor: Colors.yellow,
                      unselectedColor: Colors.cyan,
                      roundedEdges: Radius.circular(10),
                      selectedGradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.green, Colors.green],
                      ),
                      unselectedGradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.greenAccent, Colors.greenAccent],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
