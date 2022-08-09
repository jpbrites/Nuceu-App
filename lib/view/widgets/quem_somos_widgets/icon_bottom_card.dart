import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';

class IconBottomCard extends StatelessWidget {
  const IconBottomCard({
    Key? key,
    required this.colorCard,
    required this.icon,
    required this.ontap,
  }) : super(key: key);
  final Color colorCard;
  final IconData icon;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
        child: Container(
          width: 82,
          height: 82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: colorCard,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                  color: Colors.grey,
                  blurRadius: 3),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: 58,
                  height: 58,
                  child: Center(
                    child: Icon(
                      icon,
                      color: Color(0xFF263238),
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
