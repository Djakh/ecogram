import 'package:ecogram/bloc/register/register_bloc.dart';
import 'package:ecogram/cells/button.dart';
import 'package:ecogram/cells/text_field.dart';
import 'package:ecogram/routes.dart';
import 'package:ecogram/screens/auth/otp.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController extends StatefulWidget {
  const RegisterController({Key? key}) : super(key: key);

  @override
  _RegisterControllerState createState() => _RegisterControllerState();
}

class _RegisterControllerState extends State<RegisterController> {
  final _phoneController = TextEditingController();
  String? error;
  late TapGestureRecognizer _loginLink;

  /// --- Life ciycle ---

  @override
  void initState() {
    _loginLink = TapGestureRecognizer()..onTap = openSignUp;
    super.initState();
  }

  @override
  void dispose() {
    _loginLink.dispose();
    super.dispose();
  }

  /// --- Methods ---

  void openSignUp() {
    Navigator.of(context).pushNamed(
      AppRoutes.login,
    );
  }

  void openOTPage() => Navigator.of(context).push(
        CupertinoPageRoute(
            builder: (_) => OtpController(phone: _phoneController.text)),
      );

  void register() async {
    if (_phoneController.text.length < 12) {
      error = 'couldn`t sign in with those credentials';
      context.read<RegisterBloc>().add(ReloadRegisterEvent());
    } else {
      error = null;

      String phone = "+998" + _phoneController.text.trim().replaceAll(' ', '');
      context.read<RegisterBloc>().add(RegisterUserEvent({
            "phoneNumber": phone,
          }));
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
        child: Text("Register",
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

  Widget registerButton(bool unable) => Button.primary(
        text: "Register",
        onPressed: unable ? null : register,
        spinner: unable,
      );

  Widget get errorText => error != null
      ? Text(error!, style: Style.bodyw5.copyWith(color: Style.colors.red))
      : SizedBox();

  Widget get registerLink => Text.rich(
        TextSpan(
          text: "Don't have an account? ",
          style: Style.body2w6.copyWith(color: Style.colors.grey4),
          children: [
            TextSpan(
              text: "Log in",
              style: Style.body2w6.copyWith(color: Style.colors.primary),
              recognizer: _loginLink,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      );

  Widget get view => BlocConsumer<RegisterBloc, RegisterState>(
      listener: (_, state) {
        if (state is RegisterCompliedState) openOTPage();
      },
      builder: (context, state) => ListView(
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
              registerButton(state is RegisterLoadingState),
              const SizedBox(height: 24.0),
              registerLink,
              const SizedBox(height: 16.0),
              errorText
            ],
          ));

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(child: view),
      );
}
