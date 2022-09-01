import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';

class ColoredButton extends StatelessWidget {
  const ColoredButton(
      {Key? key, required this.text, required this.width, this.ontap})
      : super(key: key);
  final String text;
  final double width;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF5AC64F),
        ),
        child: Center(
          child: Text(
            text,
            style: Themes.latoRegular(16).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
