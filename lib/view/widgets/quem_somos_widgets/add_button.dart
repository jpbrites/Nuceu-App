import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton(
      {Key? key, required this.ontap, required this.right, required this.top})
      : super(key: key);
  final Function()? ontap;
  final double right;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF34AA55),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
