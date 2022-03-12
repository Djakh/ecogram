import 'package:ecogram/cells/bottom_sheet/yes_or_no_sheet.dart';
import 'package:ecogram/routes.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfileSettingsController extends StatefulWidget {
  const ProfileSettingsController({
    Key key,
  }) : super(key: key);

  @override
  State<ProfileSettingsController> createState() =>
      _ProfileSettingsControllerState();
}

class _ProfileSettingsControllerState extends State<ProfileSettingsController> {
  @override
  void initState() {
    super.initState();
  }

  /// --- Methods ---

  void showlogOutSheet(BuildContext context) => showCupertinoModalBottomSheet(
      context: context,
      builder: (_) => YesOrNoBottomSheet(
          yesFunction: () {},
          noFunction: () => Navigator.of(context).maybePop(),
          mainText: "Log out",
          subText: "Do you really want to log out the system?"));

  void openEditProile() {
    Navigator.of(context).pushNamed(
      AppRoutes.editProfile,
    );
  }

  /// --- Widgets ---

  Widget iconImages(String image) => Container(
        height: 22,
        width: 22,
        child: Image.asset(image),
      );

  Widget categoryType(
          {String title, IconData icon, bool isChavron, Function function}) =>
      GestureDetector(
        onTap: () => function(),
        child: Container(
          color: Style.colors.white,
          child: Row(children: [
            Icon(icon, color: Style.colors.primary),
            const SizedBox(width: 16),
            Text(title, style: Style.bodyw4),
            const Spacer(),
            isChavron
                ? Icon(Icons.chevron_right, color: Style.colors.grey)
                : const SizedBox(),
            const SizedBox(width: 4)
          ]),
        ),
      );

  Widget get customDivider => Divider(
        color: Style.colors.grey,
        height: 30,
        thickness: 0.2,
      );

  Widget get firstCard => Material(
        borderRadius: Style.border12,
        elevation: 0.2,
        child: Container(
            padding: Style.padding16.copyWith(right: 0),
            decoration: BoxDecoration(
              borderRadius: Style.border12,
              color: Style.colors.white,
            ),
            child: Column(
              children: [
                categoryType(
                    title: "Samandar",
                    icon: Icons.person,
                    isChavron: false,
                    function: () {}),
                customDivider,
                categoryType(
                    title: "Akromov",
                    icon: Icons.person,
                    isChavron: false,
                    function: () {}),
                customDivider,
                categoryType(
                    title: "+998 90 096 25 26",
                    icon: Icons.phone,
                    isChavron: false,
                    function: () {})
              ],
            )),
      );

  Widget get secondCard => Material(
        borderRadius: Style.border12,
        elevation: 0.2,
        child: Container(
            padding: Style.padding16.copyWith(right: 0),
            decoration: BoxDecoration(
              borderRadius: Style.border14,
              color: Style.colors.white,
            ),
            child: Column(
              children: [
                categoryType(
                    title: "Support",
                    icon: Icons.chat,
                    isChavron: true,
                    function: () {}),
                customDivider,
                categoryType(
                    title: "Edit",
                    icon: Icons.edit,
                    isChavron: true,
                    function: openEditProile),
                customDivider,
                categoryType(
                    title: "Language",
                    icon: Icons.language,
                    isChavron: true,
                    function: () {}),
                customDivider,
                categoryType(
                    title: "About",
                    icon: Icons.info,
                    isChavron: true,
                    function: () {}),
                customDivider,
                categoryType(
                    title: "Log out",
                    icon: Icons.outbond,
                    isChavron: true,
                    function: () => showlogOutSheet(context)),
              ],
            )),
      );

  Widget get view => Padding(
        padding: Style.padding16,
        child: Column(
          children: [
            firstCard,
            const SizedBox(height: 16),
            secondCard,
            const SizedBox(height: 16),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return view;
  }
}
