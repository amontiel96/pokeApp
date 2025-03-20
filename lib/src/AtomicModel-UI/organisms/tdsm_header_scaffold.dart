import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/src/AtomicModel-UI/organisms/tdsm_backgroud.dart';
import 'package:poke_app/src/AtomicModel-UI/organisms/tdsm_header.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class TDSMHeaderScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? headerType;
  final TDSMBgType backgroundType;
  final Widget? drawer;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final Color? drawerScrimColor;
  final TDSMHeader header;
  final bool drawerEnableOpenDragGesture;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool showBottomBar;
  final Widget? childBottomBar;
  final double heightAppBar;
  final double heightBottomBar;
  final double heightBodyStart;
  final Widget? bodyAppBar;
  final double bodyAppBarTop;
  final double bodyAppBarLeft;
  final double bodyAppBarRight;

  /// key used in for accessing to drawer scaffold actions, open and close
  final Key? scaffoldKey;

  final Color appBarColor;

  const TDSMHeaderScaffold({
    required this.header,
    required this.backgroundType,
    this.headerType,
    this.drawer,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEdgeDragWidth,
    this.drawerScrimColor,
    this.drawerEnableOpenDragGesture = true,
    this.scaffoldKey,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.showBottomBar = false,
    this.childBottomBar,
    this.heightAppBar = 250,
    this.heightBottomBar = 150,
    this.heightBodyStart = 0,
    this.bodyAppBar,
    this.bodyAppBarTop = 150,
    this.bodyAppBarLeft = 35,
    this.bodyAppBarRight = 35,
    super.key,
    required this.appBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: header,
        extendBodyBehindAppBar: true,
        drawer: drawer,
        drawerDragStartBehavior: drawerDragStartBehavior,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerScrimColor: drawerScrimColor,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        backgroundColor: backgroundColor,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: heightAppBar,//250 tamaño de arriba hacia a bajo del appbar color primary
              // Altura del encabezado
              child: TDSMBackground(type: backgroundType,color: appBarColor,),
            ),
            // Otros widgets que quieres poner sobre TDSMBackground
            if(bodyAppBar!=null)
            Positioned(
              top: bodyAppBarTop,
              left: bodyAppBarLeft,
              right: bodyAppBarRight,
              // Altura del encabezado
              child: bodyAppBar!
            ),
            Positioned.fill(
              top: heightBodyStart == 0 ? heightAppBar : heightBodyStart, // Altura del encabezado, de oden va a emoezar el body contenedor hacia abajo
              bottom: showBottomBar ? heightBottomBar : 10, // Altura del pie de página, define hasta donde va llegar el body contenbedor
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      body!
                      // Otros widgets
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
       // bottomNavigationBar: bottomNavigationBar
    );
  }
}
