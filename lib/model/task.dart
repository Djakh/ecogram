import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';

class Task {
  final String headText;
  final String describing;
  final String image;
  final Color color;

  Task({this.headText, this.describing, this.image, this.color});
}

List<Task> listDataTask = [
  Task(
      headText: "Bin to win",
      describing: "Recycling makes you feel good on the inside!",
      image: "assets/images/recycle.png",
      color: Style.colors.opacityGreen),
  Task(
      headText: "Bottle rocket",
      describing: "Many brands of bottled water are really just tap...",
      image: "assets/images/bottle.png",
      color: Style.colors.opacityIndigo),
  Task(
      headText: "Blazing saddles",
      describing: "There’s nothing like riding a bike. The child...",
      image: "assets/images/bike.png",
      color: Style.colors.opacityFiol),
  Task(
      headText: "Grab bag",
      describing: "Get a reusable bag (or save a used shopping ...",
      image: "assets/images/bag.png",
      color: Style.colors.opacityRed),
  Task(
      headText: "Lights out",
      describing: "Turn off the lights when you leave a room. Rem...",
      image: "assets/images/light.png",
      color: Style.colors.opacityYellow),
];
