import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int id;
  final String text;
  final String image;
  final IconData icon;
  Category({this.id, this.text, this.image, this.icon});
}

List<Category> listCategoryTab = [
  Category(
      id: 0,
      text: "Recent",
      image: "assets/images/recent.png",
      icon: Icons.history),
  Category(
      id: 1,
      text: "Featured",
      image: "assets/images/star.png",
      icon: Icons.star),
  Category(
      id: 2,
      text: "Habits",
      image: "assets/images/star.png",
      icon: Icons.flash_on),
  Category(
      id: 3,
      text: "Energy",
      image: "assets/images/thunder.png",
      icon: Icons.flash_on),
  Category(
      id: 4, text: "Water", image: "assets/images/star.png", icon: Icons.water),
  Category(
      id: 5, text: "Waste", image: "assets/images/star.png", icon: Icons.star),
  Category(
      id: 6,
      text: "Outdoors",
      image: "assets/images/star.png",
      icon: Icons.star)
];
