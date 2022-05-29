import 'package:ecogram/bloc/app.dart';
import 'package:ecogram/routes.dart';
import 'package:ecogram/screens/intro.dart';
import 'package:ecogram/switcher.dart';
import 'package:ecogram/theme/style.dart';
import 'package:ecogram/theme/theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animations/animations.dart';

class EcogramApp extends StatefulWidget {
  const EcogramApp({Key? key}) : super(key: key);

  @override
  _EcogramAppState createState() => _EcogramAppState();
}

class _EcogramAppState extends State<EcogramApp> {
  final router = FluroRouter();
  bool isLoaded = true;

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();
    AppRoutes.defineRoutes(router);
    Application.router = router;
    changeLoader();
  }

  /// --- Methods ---

  void changeLoader() async {
    await Future.delayed(Duration(seconds: 2), () => isLoaded = false);
    setState(() {});
  }

  /// --- Widgets ---

  Widget imageBox(String image, double height, double width) => Container(
        height: height,
        width: width,
        child: Image.asset(image, fit: BoxFit.contain),
      );

  Widget get loader => Container(
        color: Style.colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 162),
            imageBox("assets/images/leaf.png", 96, 96),
            imageBox("assets/images/ecogram_text.png", 87, 256),
          ],
        ),
      );

  Widget get switcher => BlocBuilder<AppCubit, AppState>(
      builder: (context, state) =>
          state.showIntro ? const IntroController() : SwitcherController());

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppCubit()),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return MaterialApp(
                theme: theme,
                color: Style.colors.white,
                localizationsDelegates: const [
                  DefaultMaterialLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                  DefaultWidgetsLocalizations.delegate,
                ],
                onGenerateRoute: Application.router?.generator,
                home: PageTransitionSwitcher(
                  duration: Duration(seconds: 1),
                  transitionBuilder: (child, animation, secondaryAnimation) =>
                      FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  ),
                  child: isLoaded ? loader : switcher,
                ));
          },
        ),
      );
}
