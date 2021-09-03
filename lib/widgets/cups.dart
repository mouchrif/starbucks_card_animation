import 'package:flutter/material.dart';

class CupsRow extends StatelessWidget {
  const CupsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(
          "assets/images/cup_L.png",
          width: 30,
          height: 120,
        ),   
        Opacity(
          opacity: 0.6,
          child: Image.asset(
            "assets/images/cup_M.png",
            width: 30,
            height: 120,
          ),
        ),
        Opacity(
          opacity: 0.4,
          child: Image.asset(
            "assets/images/cup_S.png",
            width: 30,
            height: 120,
          ),
        ),
      ],
    );
  }
}
