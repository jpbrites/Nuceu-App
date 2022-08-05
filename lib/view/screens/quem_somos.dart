import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:nuceu/themes/themes.dart';

class quem_somos extends StatefulWidget {
  const quem_somos({Key? key}) : super(key: key);

  @override
  State<quem_somos> createState() => _quem_somos_State();
}

class _quem_somos_State extends State<quem_somos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
        Container(
          color: Color.fromARGB(255, 255, 255, 255),
          margin: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 0.0,
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 0, right: 0, top: 0, bottom: 0
                  ),
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
                    left: 70, right: 70, top: 20, bottom: 20
                  ),
                  child:
                  Text(
                    'Quem Somos?',
                    style: Themes.latoLight(20),
                      ),
                ),
               ],
              ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: 20, right: 20, top: 150, bottom: 20
                  ),
                  child:
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat.",
                    style: Themes.latoLight(20),
                      ),
                ),
            ],
            ),
        ),
          );
  }
}