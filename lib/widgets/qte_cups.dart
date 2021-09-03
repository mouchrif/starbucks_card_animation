import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:starbucks_cards_animation/widgets/badge.dart';

import '../constants.dart';

class QteCups extends StatelessWidget {
  final double width;
  final double height;
  final List<String> imagesCup;
  const QteCups({Key? key, required this.width, required this.height, required this.imagesCup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(
          imagesCup.length, 
          (index) => Stack(
            children: [
              Container(
                width: (width - (4 * kDefaultPadding * 2)) / 3,
                height: height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(39),
                    bottom: Radius.circular(39),
                  ),
                  border: Border.all(
                    width: 1,
                    color: kWhiteColor.withOpacity(0.6),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: kDefaultPadding,
                      ),
                      child: Opacity(
                        opacity: index > 0 ? 0.6 : 1.0,
                        child: Hero(
                          tag: "${imagesCup[index]}",
                          child: Image.asset(
                            imagesCup[index],
                            height: height * 0.12,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: (width - (4 * kDefaultPadding * 2)) / 3,
                      height: height * 0.3 / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(39),
                        ),
                        border: Border.all(width: 2, color: kWhiteColor),
                      ),
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: kWhiteColor,
                        size: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: height * 0.3 / 2 - 35/2,
                left: (width - (4 * kDefaultPadding * 2)) / 6 - 35/2,
                child: index<1 ? BadgeWidget(text: "2") : Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
