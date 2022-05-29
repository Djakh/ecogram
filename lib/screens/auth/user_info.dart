import 'package:ecogram/cells/button.dart';
import 'package:ecogram/cells/text_field.dart';
import 'package:ecogram/screens/auth/otp.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class UserInfoController extends StatefulWidget {
  final String phone;

  const UserInfoController({Key? key, required this.phone}) : super(key: key);

  @override
  _UserInfoControllerState createState() => _UserInfoControllerState();
}

class _UserInfoControllerState extends State<UserInfoController> {
  final nameController = TextEditingController();
  final surNameController = TextEditingController();
  late TapGestureRecognizer termsTapRecognizer;
  bool acceptTerms = false;

  String error = '';

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();
    termsTapRecognizer = TapGestureRecognizer()..onTap = showTerms;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    surNameController.dispose();
  }

  /// --- Methods ---

  void showTerms() async {
    showCupertinoModalBottomSheet(
      backgroundColor: Style.colors.white,
      context: context,
      builder: (_) => Column(
        children: [
          const SizedBox(height: 12.0),
          Container(
            width: 48.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: Style.colors.grey,
              borderRadius: Style.border2,
            ),
          ),
          const SizedBox(height: 8.0),
          Text("Public offer", style: Style.body2w5),
          const SizedBox(height: 12.0),
          Divider(),
          Expanded(child: Text("Some Texts here", style: Style.bodyw3)),
        ],
      ),
    );
  }

  void openOtpPage() {
    if (nameController.text.isEmpty && surNameController.text.isEmpty) {
      error = 'name or surName shouldn`t be empty';
      setState(() {});
    } else {
      Navigator.of(context).push(
        CupertinoPageRoute(builder: (_) => OtpController(phone: widget.phone)),
      );
    }
  }

  /// --- Widgets ---

  Widget get mainText => Text("Your info",
      style: Style.headline5w3
          .copyWith(color: Style.colors.primary, fontWeight: FontWeight.w500));

  Widget inputUserFullName(String hint, TextEditingController controller) =>
      Container(
        padding: Style.paddingHor16,
        decoration: BoxDecoration(
          color: Style.colors.white,
          borderRadius: Style.border8,
        ),
        child: TextInputField.primary(
          controller: controller,
          placeholder: hint,
        ),
      );

  Widget get finishButton =>
      Button.primary(text: "Confirm", onPressed: openOtpPage);

  Widget get errorText =>
      Text(error, style: Style.bodyw5.copyWith(color: Style.colors.red));

  Widget get privacyPolicy => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Style.bodyw3.copyWith(color: Style.colors.grey8),
          children: <TextSpan>[
            TextSpan(
              text: 'By registering, you agree\nto the ',
            ),
            TextSpan(
                text: 'Privacy Policy',
                style: Style.bodyw5.copyWith(
                    decoration: TextDecoration.underline,
                    color: Style.colors.primary),
                recognizer: termsTapRecognizer),
          ],
        ),
      );

  Widget get privacyPolicyCeck => privacyPolicy;

  Widget get corps => Padding(
        padding: Style.padding16,
        child: Column(children: [
          const SizedBox(height: 40.0),
          mainText,
          const SizedBox(height: 48.0),
          inputUserFullName("Name", nameController),
          const SizedBox(height: 16.0),
          inputUserFullName("Surname", surNameController),
          const SizedBox(height: 72.0),
          finishButton,
          const SizedBox(height: 24.0),
          privacyPolicyCeck,
          const SizedBox(height: 16.0),
          errorText
        ]),
      );

  Widget get view => ListView(
        physics: const ClampingScrollPhysics(),
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
