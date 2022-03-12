import 'package:ecogram/bloc/app.dart';
import 'package:ecogram/routes.dart';
import 'package:ecogram/switcher.dart';
import 'package:ecogram/theme/style.dart';
import 'package:ecogram/theme/theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EcogramApp extends StatefulWidget {
  const EcogramApp({Key key}) : super(key: key);

  @override
  _EcogramAppState createState() => _EcogramAppState();
}

class _EcogramAppState extends State<EcogramApp> {
  final router = FluroRouter();
  bool isLoader = true;

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
    await Future.delayed(Duration(seconds: 1), () => isLoader = false);
    setState(() {});
  }

  /// --- Widgets ---

  Widget imageBox(String image, double height, double width) => Container(
        height: height,
        width: width,
        child: Image.asset(image, fit: BoxFit.contain),
      );

  Widget get loader => SafeArea(
        child: Container(
          color: Style.colors.white,
          padding: Style.padding16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 162),
              imageBox("assets/images/leaf.png", 96, 96),
              imageBox("assets/images/ecogram_text.png", 87, 256),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => AppCubit()),
          ],
          child: CupertinoApp(
              theme: theme,
              color: Style.colors.white,
              localizationsDelegates: const [
                DefaultMaterialLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
              ],
              onGenerateRoute: Application.router.generator,
              home: Container(
                color: Style.colors.white,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: isLoader ? loader : Switcher(),
                ),
              )));
}
