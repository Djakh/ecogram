import 'package:ecogram/cells/button.dart';
import 'package:ecogram/cells/text_field.dart';
import 'package:ecogram/routes.dart';
import 'package:ecogram/screens/auth/otp.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginController extends StatefulWidget {
  const LoginController({Key? key}) : super(key: key);

  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  final _phoneController = TextEditingController();
  String error = '';
  late TapGestureRecognizer _registerLink;

  /// --- Life ciycle ---

  @override
  void initState() {
    _registerLink = TapGestureRecognizer()..onTap = openSignUp;
    super.initState();
  }

  @override
  void dispose() {
    _registerLink.dispose();
    super.dispose();
  }

  /// --- Methods ---

  void openSignUp() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.register,
      (_) => false,
    );
  }

  void openOTPage() => Navigator.of(context).push(
        CupertinoPageRoute(
            builder: (_) => OtpController(phone: _phoneController.text)),
      );

  void submit() async {
    if (_phoneController.text.length < 12) {
      error = 'couldn`t sign in with those credentials';
      setState(() {});
    } else {
      openOTPage();
    }
  }

  /// --- Widgets ---

  Widget get navigationBar => CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        backgroundColor: Style.colors.white,
        trailing: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  CupertinoIcons.back,
                  color: Style.colors.grey3,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      );

  Widget get mainText => Center(
        child: Text("Log in",
            style: Style.headline5w3.copyWith(
                color: Style.colors.primary, fontWeight: FontWeight.w500)),
      );

  Widget get description => Center(
        child: Text(
          "Please, enter your phone number to log in the system",
          style: Style.bodyw3,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      );

  Widget get phoneTextInput => TextInputField.phone(
        controller: _phoneController,
        height: 56,
        placeholder: "phone number",
        backgroundColor: Style.colors.grey0p5,
      );

  Widget get finishButton => Button.primary(text: "Log in", onPressed: submit);

  Widget get errorText =>
      Text(error, style: Style.bodyw5.copyWith(color: Style.colors.red));

  Widget get registerLink => Text.rich(
        TextSpan(
          text: "Don't have an account? ",
          style: Style.body2w6.copyWith(color: Style.colors.grey4),
          children: [
            TextSpan(
              text: "Register",
              style: Style.body2w6.copyWith(color: Style.colors.primary),
              recognizer: _registerLink,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      );

  Widget get view => ListView(
        physics: ClampingScrollPhysics(),
        padding: Style.padding16,
        children: [
          const SizedBox(height: 100.0),
          mainText,
          const SizedBox(height: 16.0),
          description,
          const SizedBox(height: 48.0),
          phoneTextInput,
          const SizedBox(height: 72.0),
          finishButton,
          const SizedBox(height: 24.0),
          registerLink,
          const SizedBox(height: 16.0),
          errorText
        ],
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(child: view),
      );
}
