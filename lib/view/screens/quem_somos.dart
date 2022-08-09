import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/view/widgets/quem_somos_widgets/icon_bottom_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class QuemSomos extends StatefulWidget {
  const QuemSomos({Key? key}) : super(key: key);

  @override
  State<QuemSomos> createState() => _QuemSomosState();
}

class _QuemSomosState extends State<QuemSomos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        margin: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 0.0,
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    iconSize: 32,
                    constraints: const BoxConstraints(),
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 70, right: 70, top: 20, bottom: 20),
                    child: Text(
                      'Quem Somos?',
                      style: Themes.latoLight(20),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 190, bottom: 20),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat.",
                style: Themes.latoLight(20),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 155, top: 10, bottom: 0),
              child: Text(
                "Entre em contato!",
                style: Themes.latoBold(24),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
              child: Row(
                children: <Widget>[
                    Padding(
                    padding:
                      const EdgeInsets.only(left: 20, right: 0, top: 20, bottom: 0),
                    child:
                    IconBottomCard(
                      colorCard: const Color(0xFF92E3A9),
                      icon: Icons.whatsapp,
                      ontap: () {
                        
                      },
                    ),
                    ),
                    Padding(
                    padding:
                      const EdgeInsets.only(left: 20, right: 0, top: 20, bottom: 0),
                    child:
                    IconBottomCard(
                      colorCard: const Color(0xFFF99C66),
                      icon: Icons.phone,
                      ontap: () {
                        
                      },
                    ),
                    ),

                    Padding(
                    padding:
                      const EdgeInsets.only(left: 20, right: 0, top: 20, bottom: 0),
                    child:
                    IconBottomCard(
                      colorCard: const Color(0xFF82BCD7),
                      icon: FontAwesomeIcons.instagram,
                      ontap: () {
                       
                        
                      },
                    ),
                    )
      
                     
                    ]
                    ),
            ),
                    ]
                    ),
                
              ),
    );
             
 
          
  }

       
}
