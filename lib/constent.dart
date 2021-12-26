import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
  static TextStyle textStyle = GoogleFonts.kaushanScript(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
