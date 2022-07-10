import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Themes {
  static TextStyle homeTitlBold = GoogleFonts.lato(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle homeTitle = GoogleFonts.lato(
    fontSize: 19,
    fontWeight: FontWeight.w300,
    wordSpacing: 1.5,
    color: Colors.black,
  );

  static TextStyle latoBold = GoogleFonts.lato(
    fontWeight: FontWeight.w900,
    fontSize: 20,
  );

  static TextStyle latoBoldWhite = GoogleFonts.lato(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: Colors.white,
  );
  static EdgeInsets paddingHome =
      EdgeInsets.symmetric(horizontal: 30, vertical: 20);
}
