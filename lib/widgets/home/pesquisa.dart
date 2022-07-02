import 'package:flutter/material.dart';

class Pesquisa extends StatelessWidget {
  const Pesquisa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextField(
        controller: TextEditingController(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          filled: true,
          fillColor: const Color(0xFF797979),
          hintText: 'Procurar',
          hintStyle: const TextStyle(
            color: Color(0xFFD0D0D0),
            fontFamily: 'Lato',
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(
              color: Color(0xFF797979),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(
              color: Color(0xFF797979),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(
              color: Color(0xFF494949),
            ),
          ),
        ),
      ),
    );
  }
}
