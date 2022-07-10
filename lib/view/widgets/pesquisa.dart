import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pesquisa extends StatelessWidget {
  const Pesquisa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            filled: true,
            fillColor: const Color(0xFFC3C3C3),
            hintText: 'Procurar',
            hintStyle: GoogleFonts.robotoFlex(
              fontSize: 12,
              color: Color(0xFF535353),
            ),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.search,
                color: Color(0xFF535353),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Color(0xFF494949),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
