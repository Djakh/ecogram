import 'package:ecogram/cells/bottom_sheet/yes_or_no_sheet.dart';
import 'package:ecogram/cells/button.dart';
import 'package:ecogram/cells/text_field.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EditProfileController extends StatefulWidget {
  const EditProfileController({Key key}) : super(key: key);
  @override
  _EditProfileControllerState createState() => _EditProfileControllerState();
}

class _EditProfileControllerState extends State<EditProfileController> {
  final nameController = TextEditingController(text: "Samandar");
  final surNameController = TextEditingController(text: "Akromov");

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    surNameController.dispose();
  }

  /// --- Methods ---

  void showSaveSheet() => showCupertinoModalBottomSheet(
      context: context,
      builder: (_) => YesOrNoBottomSheet(
          yesFunction: () {},
          noFunction: () => Navigator.of(context).maybePop(),
          mainText: "Save",
          subText: "Do you really want to save changes?"));

  /// --- Widgets ---

  Widget get popChavron => GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.chevron_left,
          size: 32.0,
          color: Style.colors.white,
        ),
      );

  Widget get profileHeader => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          popChavron,
          Text(
            "Edit",
            style: Style.body3w5.copyWith(color: Style.colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
            width: 40,
            child: Button.text(
              onPressed: showSaveSheet,
              text: "Save",
              style: Style.bodyw3.copyWith(color: Style.colors.white),
            ),
          )
        ],
      );
  Widget get headerBox => Padding(
      padding: Style.padding16.copyWith(
        top: 8.0,
        bottom: 40.0,
      ),
      child: profileHeader);

  Widget get containerBox => Container(
        padding: Style.padding20.copyWith(bottom: 0.0),
        decoration: BoxDecoration(
          color: Style.colors.background,
          borderRadius: Style.borderVer36,
        ),
      );

  Widget get header => Container(
        child: Container(
          width: double.infinity,
          color: Style.colors.grayishDarkBlue,
          child: Stack(
            children: [
              headerBox,
              Positioned(
                  child: containerBox, bottom: 0.0, right: 0.0, left: 0.0),
            ],
          ),
        ),
      );

  Widget iconImages(String image) => Container(
        height: 22,
        width: 22,
        child: Image.asset(image),
      );

  Widget inputUserFullName(String hint, TextEditingController controller) =>
      Expanded(
        child: TextInputField.ordinary(
          controller: controller,
          placeholder: hint,
          hintColor: Style.colors.grey6,
        ),
      );

  Widget get changeNumberButton => GestureDetector(
        onTap: () {},
        child: Container(
          color: Style.colors.white,
          padding: Style.paddingVer12,
          child: Row(children: [
            Icon(Icons.phone, color: Style.colors.primary),
            const SizedBox(width: 16),
            Text("Phone", style: Style.bodyw4),
            Spacer(),
            Icon(Icons.chevron_right, color: Style.colors.grey),
            const SizedBox(width: 4)
          ]),
        ),
      );

  Widget categoryType(
          IconData icon, String hint, TextEditingController controller) =>
      Row(children: [
        Icon(icon, color: Style.colors.primary),
        const SizedBox(width: 16),
        inputUserFullName(hint, controller)
      ]);

  Widget get customDivider => Divider(
        color: Style.colors.grey,
        thickness: 0.2,
      );

  Widget get corps => Padding(
        padding: Style.padding16,
        child: Material(
          borderRadius: Style.border12,
          elevation: 0.2,
          child: Container(
              padding: Style.padding8.copyWith(right: 0, left: 16),
              decoration: BoxDecoration(
                borderRadius: Style.border12,
                color: Style.colors.white,
              ),
              child: Column(
                children: [
                  categoryType(Icons.person, "Name", nameController),
                  customDivider,
                  categoryType(
                      Icons.person, "Surname", surNameController),
                  customDivider,
                  changeNumberButton
                ],
              )),
        ),
      );

  Widget get view => Container(
        color: Style.colors.background,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [header, corps],
        ),
      );
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: Style.colors.grayishDarkBlue,
        child: SafeArea(
          bottom: false,
          child: view,
        ),
      );
}
