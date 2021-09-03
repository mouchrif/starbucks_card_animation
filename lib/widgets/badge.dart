import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_cards_animation/constants.dart';
import 'package:starbucks_cards_animation/widgets/custom_shaper.dart';

class BadgeWidget extends StatelessWidget {
  final String text;
  const BadgeWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = 35.0;
    return CustomPaint(
      size: Size(
          width,
          (width * 1)
            .toDouble()), 
      painter: RPSCustomPainter(),
      child: Container(
        width: width, 
        height: width, 
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.lato(
              color: kWhiteColor,
              fontSize: 12.0
            ),
          ),
        ),
      ),
    );
  }
}
