import 'package:ecogram/app.dart';
import 'package:ecogram/screens/auth/login.dart';
import 'package:ecogram/screens/auth/signup.dart';
import 'package:ecogram/screens/tab_pages.dart/profile/edit_profile.dart';
import 'package:fluro/fluro.dart';

class Application {
  static FluroRouter router;
}

class AppRoutes {
  static String app = '/';
  static String login = '/login';
  static String signup = '/signup';
  static String editProfile = '/editProfile';

  static void defineRoutes(FluroRouter router) {
    router.notFoundHandler = notFound;
    router.define(app, handler: appHandler);
    router.define(login, handler: loginHandler);
    router.define(signup, handler: signupHandler);
    router.define(editProfile, handler: editProfileHandler);
  }
}

final appHandler = Handler(handlerFunc: (_, __) => const EcogramApp());

final notFound = Handler(handlerFunc: (_, __) => const EcogramApp());
final loginHandler = Handler(handlerFunc: (_, __) => const LoginController());

final signupHandler = Handler(handlerFunc: (_, __) => const SignUpController());

final editProfileHandler =
    Handler(handlerFunc: (_, __) => const EditProfileController());
