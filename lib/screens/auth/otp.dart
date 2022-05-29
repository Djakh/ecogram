import 'package:ecogram/cells/button.dart';
import 'package:ecogram/routes.dart';
import 'package:ecogram/screens/home.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpController extends StatefulWidget {
  final String phone;

  const OtpController({Key? key, required this.phone}) : super(key: key);

  @override
  _OtpControllerState createState() => _OtpControllerState();
}

class _OtpControllerState extends State<OtpController> {
  final otpController = TextEditingController();

  String error = '';

  /// --- Life Cycles ---

  @override
  void dispose() {
    super.dispose();
  }

  /// --- Methods ---

  void openSignUp() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.signup,
      (_) => false,
    );
  }

  void openHomePage() {
    Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(builder: (_) => HomeController()),
      (_) => false,
    );
  }

  void verifyOtp() async {
    if (otpController.text == null || otpController.text.length != 4) {
      error = "Otp numbers must be six digits";
      setState(() {});
    } else {
      openHomePage();
    }
  }

  /// --- Widgets ---

  Widget get mainText => Text("+998 " + widget.phone,
      style: Style.headline5w3
          .copyWith(color: Style.colors.primary, fontWeight: FontWeight.w500));

  Widget get description => Text(
        "Enter the SMS code we have sent you",
        style: Style.bodyw3,
        textAlign: TextAlign.center,
      );

  Widget get inputOtp => Padding(
        padding: Style.paddingHor30,
        child: Material(
          color: Style.colors.transparent,
          child: PinFieldAutoFill(
            decoration: BoxLooseDecoration(
              bgColorBuilder: FixedColorBuilder(
                Style.colors.white,
              ),
              strokeColorBuilder: FixedColorBuilder(
                Style.colors.grey2,
              ),
              radius: Radius.circular(10),
            ),
            autoFocus: true,
            keyboardType: TextInputType.phone,
            controller: otpController,
            codeLength: 4,
            onCodeChanged: (code) {
              if (code != null && code.length == 6)
                FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        ),
      );

  Widget get finishButton => Button.primary(text: "Next", onPressed: verifyOtp);

  Widget get notReceived => Column(
        children: [
          Text(
            "Not received the code?",
            style: Style.bodyw3,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 30,
            child: Button.text(
                onPressed: () {},
                text: "Resend the code",
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
        padding: Style.paddingHor16,
        child: Column(children: [
          const SizedBox(height: 40.0),
          mainText,
          const SizedBox(height: 16.0),
          description,
          const SizedBox(height: 116.0),
          inputOtp,
          const SizedBox(height: 64.0),
          finishButton,
          const SizedBox(height: 16.0),
          errorText,
          const SizedBox(height: 24.0),
          notReceived,
        ]),
      );

  Widget get view => ListView(
        physics: ClampingScrollPhysics(),
        children: [corps],
      );

  PreferredSizeWidget get appBar => AppBar(
        title: Text("Page", style: Style.body3w5),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        body: view,
      );
}
