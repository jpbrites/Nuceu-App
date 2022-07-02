import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final textoCard;
  final iconCard;

  CardHome({
    this.textoCard,
    this.iconCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Essa função na verdade virá pela home
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: const Color(0xFF92E3A9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                textoCard,
                style: TextStyle(fontFamily: 'Lato', fontSize: 19),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF535353),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Icon(
                    iconCard,
                    size: 85,
                    color: Color(0xFF92E3A9),
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
