import 'package:ecogram/theme/style.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
    brightness: Style.appBrightness,
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Style.colors.blue,
        centerTitle: true,
        iconTheme: IconThemeData(color: Style.colors.black, size: 24)),
    primaryColor: Style.colors.primary,
    scaffoldBackgroundColor: Style.colors.white,
    iconTheme: IconThemeData(color: Style.colors.black));
