import 'package:ecogram/app.dart';
import 'package:ecogram/screens/auth/login.dart';
import 'package:ecogram/screens/auth/register.dart';

import 'package:fluro/fluro.dart';

class Application {
  static FluroRouter? router;
}

class AppRoutes {
  static String app = '/';
  static String login = '/login';
  static String register = '/signup';

  static void defineRoutes(FluroRouter router) {
    router.notFoundHandler = notFound;
    router.define(app, handler: appHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
  }
}

final appHandler = Handler(handlerFunc: (_, __) => const EcogramApp());

final notFound = Handler(handlerFunc: (_, __) => const EcogramApp());
final loginHandler = Handler(handlerFunc: (_, __) => const LoginController());

final registerHandler =
    Handler(handlerFunc: (_, __) => const RegisterController());
