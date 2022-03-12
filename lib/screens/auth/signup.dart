import 'package:ecogram/cells/button.dart';
import 'package:ecogram/cells/text_field.dart';
import 'package:ecogram/routes.dart';
import 'package:ecogram/screens/auth/user_info.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignUpController extends StatefulWidget {
  const SignUpController({Key key}) : super(key: key);

  @override
  _SignUpControllerState createState() => _SignUpControllerState();
}

class _SignUpControllerState extends State<SignUpController> {
  final phoneController = TextEditingController();
  String error = '';

  /// --- Life Cycles ---

  @override
  void dispose() {
    super.dispose();
  }

  /// --- Methods ---

  void openLogin() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.login,
      (_) => false,
    );
  }

  void openUserInfo() {
    if (phoneController.text.length < 9) {
      error = 'couldn`t sign in with those credentials';
      setState(() {});
    } else {
      Navigator.of(context).push(
        CupertinoPageRoute(
            builder: (_) => UserInfoController(phone: phoneController.text)),
      );
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
                  color: Style.colors.gray,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      );

  Widget get mainText => Text("Register",
      style: Style.headline5w3
          .copyWith(color: Style.colors.primary, fontWeight: FontWeight.w500));

  Widget get description => Padding(
      padding: Style.paddingHor40,
      child: Text(
        "Please, enter your phone number to register ",
        style: Style.bodyw3,
        textAlign: TextAlign.center,
      ));

  Widget get numberField => TextInputField.phone(
        keyboardType: TextInputType.phone,
        controller: phoneController,
        placeholder: "-- --- -- --",
        hintColor: Style.colors.black,
      );

  Widget get inputPhoneNumber => Container(
        padding: Style.paddingHor16,
        decoration: BoxDecoration(
          color: Style.colors.white,
          borderRadius: Style.border8,
        ),
        child: Row(
          children: [
            Text("+998", style: Style.body2w3),
            SizedBox(
                height: 25, child: VerticalDivider(color: Style.colors.grey)),
            const SizedBox(width: 14),
            Expanded(child: numberField)
          ],
        ),
      );

  Widget get finishButton => Button.primary(
        text: "Register",
        onPressed: openUserInfo,
      );

  Widget get signUpTextButton => Column(
        children: [
          Text(
            "Already have an account?",
            style: Style.bodyw3,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 30,
            child: Button.text(
                onPressed: openLogin,
                text: "Log in",
                height: 10,
                style: Style.bodyw5.copyWith(
                    decoration: TextDecoration.underline,
                    color: Style.colors.primary)),
          )
        ],
      );

  Widget get errorText =>
      Text(error, style: Style.bodyw5.copyWith(color: Style.colors.red));

  Widget get corps => Padding(
        padding: Style.padding16,
        child: Column(children: [
          const SizedBox(height: 100.0),
          mainText,
          const SizedBox(height: 16.0),
          description,
          const SizedBox(height: 48.0),
          inputPhoneNumber,
          const SizedBox(height: 16.0),
          finishButton,
          const SizedBox(height: 24.0),
          signUpTextButton,
          errorText
        ]),
      );

  Widget get view => ListView(
        physics: ClampingScrollPhysics(),
        children: [corps],
      );

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: Style.colors.background,
        child: view,
      );
}
