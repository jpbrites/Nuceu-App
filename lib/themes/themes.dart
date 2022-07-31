import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Themes {
  static TextStyle latoRegular(double fontsize) {
    return GoogleFonts.lato(
      fontSize: fontsize,
      fontWeight: FontWeight.w500,
      wordSpacing: 1.5,
      color: Colors.black,
    );
  }

  static TextStyle latoLight(double fontsize) {
    return GoogleFonts.lato(
      fontSize: fontsize,
      fontWeight: FontWeight.w300,
      wordSpacing: 1.5,
      color: Colors.black,
    );
  }

  static TextStyle latoExtraBold(double fontsize) {
    return GoogleFonts.lato(
      fontWeight: FontWeight.w900,
      fontSize: fontsize,
    );
  }

  static TextStyle latoBold(double fontsize) {
    return GoogleFonts.lato(
      fontWeight: FontWeight.w800,
      fontSize: fontsize,
    );
  }

  static EdgeInsets paddingHome =
      const EdgeInsets.symmetric(horizontal: 30, vertical: 20);
}
