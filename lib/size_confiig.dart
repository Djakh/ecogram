import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double rhor; // rounded blockSizeHorizontal to one
  static late double rver; // rounded blockSizeVertical to one

  void init(BoxConstraints constraints) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    rhor = blockSizeHorizontal / 3.9; // blockSizeHorizontal rounds to one
    rver = blockSizeVertical / 8.44; // blockSizeVertical rounds to one
  }
}
