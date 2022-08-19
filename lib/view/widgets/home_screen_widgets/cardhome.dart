import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuceu/themes/themes.dart';

class CardHome extends StatelessWidget {
  final String textoCard;
  final String dataTextoCard;
  final String id;
  final Color cardColor;
  final Color smallCardColor;
  final bool thereAreEvents;
  final Function()? ontap;

  CardHome(
      {required this.textoCard,
      required this.dataTextoCard,
      required this.cardColor,
      required this.smallCardColor,
      required this.thereAreEvents,
      required this.ontap,
      required this.id});

  @override
  Widget build(BuildContext context) {
    IconData whatIcon;
    if (thereAreEvents == true || thereAreEvents == null) {
      whatIcon = Icons.event_available_outlined;
    } else {
      whatIcon = Icons.do_not_disturb_on;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          //constraints: BoxConstraints(
          //  maxHeight: 216,
          //),
          height: 216,
          margin: const EdgeInsets.only(bottom: 3),
          width: 216,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                  color: Colors.grey,
                  blurRadius: 3),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 61,
                  height: 51,
                  decoration: BoxDecoration(
                    color: smallCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      whatIcon,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Text(
                  textoCard,
                  style: Themes.latoBold(20).copyWith(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    dataTextoCard,
                    style: Themes.latoBold(20).copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
