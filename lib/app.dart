import 'package:ecogram/routes.dart';
import 'package:ecogram/theme/style.dart';
import 'package:ecogram/theme/theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EcogramApp extends StatefulWidget {
  const EcogramApp({Key key}) : super(key: key);

  @override
  _EcogramAppState createState() => _EcogramAppState();
}

class _EcogramAppState extends State<EcogramApp> {
  final router = FluroRouter();

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();
    AppRoutes.defineRoutes(router);
    Application.router = router;
  }

  /// --- Widgets ---

  @override
  Widget build(BuildContext context) => CupertinoApp(
      theme: theme,
      color: Style.colors.white,
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      onGenerateRoute: Application.router.generator,
      home: TestPage());
}

class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Style.colors.white,);
  }
}
