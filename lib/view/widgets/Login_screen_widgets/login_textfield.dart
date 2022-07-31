import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuceu/themes/themes.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField(
      {Key? key,
      required this.textController,
      required this.obscureText,
      this.validator,
      required this.keyboardType})
      : super(key: key);
  final TextEditingController textController;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: widget.textController,
        obscureText: widget.obscureText,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        style: Themes.latoRegular(20),
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(127, 0, 0, 0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(127, 0, 0, 0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(127, 0, 0, 0),
            ),
          ),
        ),
      ),
    );
  }
}
