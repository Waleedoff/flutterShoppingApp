import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;
  final TextDecoration underLine;
  TextUtils(
      {super.key,
      required this.text,
      required this.fontsize,
      required this.fontWeight,
      required this.color,
      required this.underLine});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
            textStyle: TextStyle(
          decoration: underLine,
          color: color,
          fontSize: fontsize,
          fontWeight: fontWeight,
        )));
  }
}
