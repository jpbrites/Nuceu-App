import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/view/widgets/navigation_drawer.dart';
import 'package:nuceu/view/widgets/quem_somos_widgets/icon_bottom_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class QuemSomos extends StatefulWidget {
  const QuemSomos({Key? key}) : super(key: key);

  @override
  State<QuemSomos> createState() => _QuemSomosState();
}

class _QuemSomosState extends State<QuemSomos> {
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
          'Quem somos?',
          style: Themes.latoLight(20),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        margin: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 0.0,
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
            child: Image.asset(
              'imagens/quem_somos.png',
              width: 150.0,
              height: 150.0,
            ),
          ),
          Padding( //falta centralizar
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              style: Themes.latoLight(20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 155, top: 10, bottom: 0),
            child: Text(
              "Entre em contato!",
              style: Themes.latoBold(24),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            child: Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 0, top: 20, bottom: 0),
                child: IconBottomCard(
                  colorCard: const Color(0xFF92E3A9),
                  icon: Icons.whatsapp,
                  ontap: () {
                    launchExternalWebsite('https://wa.me/5587991592631?text=Falae+pc+lind%C3%A3o');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 0, top: 20, bottom: 0),
                child: IconBottomCard(
                  colorCard: const Color(0xFFF99C66),
                  icon: Icons.phone,
                  ontap: () {
                    launchNuceuPhone();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 0, top: 20, bottom: 0),
                child: IconBottomCard(
                  colorCard: const Color(0xFF82BCD7),
                  icon: FontAwesomeIcons.instagram,
                  ontap: () {
                    launchExternalWebsite('https://www.instagram.com/nuceu_univasf/');
                  },
                ), 
              )
            ]),
          ),
        ]),
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

  void launchNuceuPhone() async {
    var telUri = Uri(
      scheme: 'tel',
      path: "087991592631"
    );
    if(await canLaunchUrl(telUri)){
      await launchUrl(telUri);
    } else {
      throw 'Could not launch $telUri';
    }
  }
}
