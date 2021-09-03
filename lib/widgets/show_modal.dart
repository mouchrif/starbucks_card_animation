import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:blur/blur.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_cards_animation/models/drink.dart';
import 'package:starbucks_cards_animation/widgets/qte_cups.dart';
import 'package:starbucks_cards_animation/widgets/ritch_text.dart';

import '../constants.dart';

Future showModal(
  BuildContext context, 
  Size size,
  int index
) {
  return showModalBottomSheet(
    barrierColor: Colors.transparent,
    elevation: 0,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      height: size.height * (1 - 0.15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(29),
          topRight: Radius.circular(29),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight * 0.5,
              child: Hero(
                tag: "${Drink.drinks[index].assetBackgroundName}",
                child: Image.asset(
                  Drink.drinks[index].assetBackgroundName,
                  width: constraints.maxWidth,
                  fit: BoxFit.cover,
                ).blurred(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(29),
                    topRight: Radius.circular(29),
                  ),
                  colorOpacity: 0.2,
                  blur: 4,
                  blurColor: Drink.drinks[index].color,
                  overlay: Container(
                    padding: const EdgeInsets.only(
                      top: kDefaultPadding,
                      left: kDefaultPadding * 1.6,
                    ),
                    width: constraints.maxWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Drink.drinks[index].name,
                          style: GoogleFonts.lato(
                              color: Drink.drinks[index].color,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          Drink.drinks[index].title,
                          style: GoogleFonts.lato(
                              color: kWhiteColor,
                              fontSize: 38.0,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: constraints.maxHeight * 0.8,
              child: LayoutBuilder(
                builder: (context, constraints) => Container(
                  padding: const EdgeInsets.fromLTRB(kDefaultPadding * 2,
                      kDefaultPadding, kDefaultPadding * 2, 0),
                  color: Drink.drinks[index].color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Icon(
                          FontAwesomeIcons.chevronDown,
                          size: 34.0,
                          color: kWhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        Drink.drinks[index].text,
                        style: GoogleFonts.lato(
                          color: kWhiteColor,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      QteCups(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        imagesCup: [
                          "assets/images/cup_L.png",
                          "assets/images/cup_M.png",
                          "assets/images/cup_S.png",
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 2,
                          vertical: kDefaultPadding / 2,
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomDisplayDoubleNumber(
                              number: Drink.drinks[index].price,
                            ),
                            Text(
                              "Order",
                              style: GoogleFonts.lato(
                                color: kWhiteColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -constraints.maxHeight * 0.38,
              left: 0,
              right: 0,
              child: Hero(
                tag: "${Drink.drinks[index].assetName}",
                child: Image.asset(
                  Drink.drinks[index].assetName,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
