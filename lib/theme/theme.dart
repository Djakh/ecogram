import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';

final theme = CupertinoThemeData(
  brightness: Style.appBrightness,
  primaryColor: Style.colors.primary,
  scaffoldBackgroundColor: Style.colors.background,
  barBackgroundColor: Style.colors.background,
  textTheme: CupertinoTextThemeData(
    textStyle: Style.bodyw3,
    navActionTextStyle: TextStyle(color: Style.colors.black),
    navTitleTextStyle: Style.body3w5,
  ),
);
