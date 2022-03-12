import 'package:ecogram/app.dart';
import 'package:fluro/fluro.dart';

class Application {
  static FluroRouter router;
}

class AppRoutes {
  static String app = '/';

  static void defineRoutes(FluroRouter router) {
    router.notFoundHandler = notFound;
    router.define(app, handler: appHandler);
  }
}

final appHandler = Handler(handlerFunc: (_, __) => const EcogramApp());

final notFound = Handler(handlerFunc: (_, __) => const EcogramApp());
