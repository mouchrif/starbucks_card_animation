import 'package:flutter/material.dart';
import 'package:starbucks_cards_animation/constants.dart';

class Drink {
  final String name;
  final String title;
  final String text;
  final double price;
  final String assetName;
  final String assetBackgroundName;
  final List<String> assetsTRB;
  final Color color;
  Drink({
    required this.name,
    required this.title,
    required this.text,
    required this.price,
    required this.assetName,
    required this.assetBackgroundName,
    required this.assetsTRB,
    required this.color,
  });

  static List<Drink> drinks = [
    Drink(
      name: "Tirami-Su",
      title: "Frappuccino",
      text: "then top with whipped cream and mocha drizzle to bring you endless java joy.",
      price: 4.70,
      assetName: "assets/images/tiramissu.png",
      assetBackgroundName: "assets/images/tiramissu_background.jpg",
      assetsTRB: [
        "assets/images/bean_top.png",
        "assets/images/bean_right.png",
        "assets/images/bean_bottom.png",
      ],
      color: kBrownColor,
    ),
    Drink(
      name: "Green-Tea",
      title: "Frappuccino",
      text: "milk and ice and top it with sweetened whipped cream to give you a delicious boost of energy.",
      price: 5.60,
      assetName: "assets/images/green_tea.png",
      assetBackgroundName: "assets/images/green_tea_background.jpeg",
      assetsTRB: [
        "assets/images/tea_top.png",
        "assets/images/tea_right.png",
        "assets/images/tea_bottom.png",
      ],
      color: kGreenColor,
    ),
    Drink(
      name: "Triple-Mocha",
      title: "Frappuccino",
      text: "layers of whipped cream that's infused with cold brew, white chocolat mocha and dark caramel.",
      price: 7.30,
      assetName: "assets/images/triple_mocha.png",
      assetBackgroundName: "assets/images/triple_mocha_background.jpg",
      assetsTRB: [
        "assets/images/chocolat_top.png",
        "assets/images/chocolat_right.png",
        "assets/images/chocolat_bottom.png",
      ],
      color: kBrownColor,
    ),
  ];
}
