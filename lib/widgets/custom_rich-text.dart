import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final Color color;
  const CustomRichText({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text.substring(0, text.indexOf('-')),
            style: GoogleFonts.lato(
              color: color.withOpacity(0.65),
              fontWeight: FontWeight.w900,
              fontSize: 44.0,
            ),
          ),
          TextSpan(
            text: text.substring(
                text.indexOf('-') + 1,
                text.length),
            style: GoogleFonts.lato(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: 44.0,
            ),
          ),
        ],
      ),
    );
  }
}
