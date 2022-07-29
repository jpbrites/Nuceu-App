import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';

class HomeBottomCard extends StatelessWidget {
  const HomeBottomCard({
    Key? key,
    required this.colorCard,
    required this.colorIconCard,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final Color colorCard;
  final Color colorIconCard;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Container(
          width: MediaQuery.of(context).size.width,
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
                  width: 61,
                  height: 51,
                  decoration: BoxDecoration(
                    color: colorIconCard,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Text(
                title,
                style: Themes.latoBoldWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
