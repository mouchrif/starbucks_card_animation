import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class CustomDisplayDoubleNumber extends StatelessWidget {
  final double number;
  const CustomDisplayDoubleNumber({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.lato(
            color: kWhiteColor, fontSize: 28.0, fontWeight: FontWeight.w400),
        children: [
          TextSpan(
            text: "\$ ",
          ),
          TextSpan(
            text: number.toStringAsFixed(2).substring(
                0, number.toStringAsFixed(2).indexOf('.')),
          ),
          TextSpan(text: "."),
          TextSpan(
            text: number.toStringAsFixed(2).substring(
                number.toStringAsFixed(2).indexOf('.') + 1,
                number.toStringAsFixed(2).length),
            style: GoogleFonts.lato(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
