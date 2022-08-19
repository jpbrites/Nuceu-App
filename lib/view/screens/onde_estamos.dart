import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/view/widgets/navigation_drawer.dart';
import 'package:nuceu/view/widgets/quem_somos_widgets/icon_bottom_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class OndeEstamos extends StatefulWidget {
  const OndeEstamos({Key? key}) : super(key: key);

  @override
  State<OndeEstamos> createState() => _OndeEstamosState();
}

class _OndeEstamosState extends State<OndeEstamos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Onde Estamos?',
          style: Themes.latoLight(20),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 0.0,
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Padding(
          
            padding: EdgeInsets.only(left: 7, right: 20, top: 0, bottom: 0),
            child: Image.asset(
              'imagens/onde_estamos.png',
              width: 223.0,
              height: 221.0,
              
            ),
          ),
          Padding( 
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              style: Themes.latoLight(20),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            child: Row(children: <Widget>[
              Padding(
            padding: EdgeInsets.only(left: 10, right: 0, top: 10, bottom: 0),
            child: Text(
              "Encontre-nos: ",
              style: Themes.latoRegular(24),
            ),
          ),
              Padding(
                padding: EdgeInsets.only(left: 0, right: 0, top: 13, bottom: 0),
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.mapLocationDot
                  ),
                  onPressed: () {
                    launchExternalWebsite('https://goo.gl/maps/QgKb8rHiKJUsLi4eA');
                  },
                  ),
                
              ),
            ]
            ),
          ),
          Padding( 
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: Themes.latoLight(20),
            ),
          ),
        ]
        ),
      ),
    );

  }
  void launchExternalWebsite(String url) async {
    var urlUri = Uri.parse(url);
    if(await canLaunchUrl(urlUri)){
      await launchUrl(
        urlUri,
        mode: LaunchMode.externalApplication
        );
    } else {
      throw 'Could not launch $urlUri';
    }
  }
}