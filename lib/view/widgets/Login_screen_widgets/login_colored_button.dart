import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';

class LoginColoredButon extends StatelessWidget {
  const LoginColoredButon({
    Key? key,
    required this.onTap,
    required this.color,
    required this.label,
    this.width = double.infinity,
    required this.textColor,
    required this.google,
  }) : super(key: key);

  final void Function() onTap;
  final Color color;
  final String label;
  final double width;
  final Color textColor;
  final bool google;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: 58,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (google)
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    'imagens/google.png',
                    height: 30,
                  ),
                ),
              Text(
                label,
                style: Themes.latoBold(20).copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
