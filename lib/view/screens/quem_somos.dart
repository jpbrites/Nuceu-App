import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/view/widgets/navigation_drawer.dart';
import 'package:nuceu/view/widgets/quem_somos_widgets/add_button.dart';
import 'package:nuceu/view/widgets/quem_somos_widgets/icon_bottom_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class QuemSomos extends StatefulWidget {
  const QuemSomos({Key? key}) : super(key: key);

  @override
  State<QuemSomos> createState() => _QuemSomosState();
}

class _QuemSomosState extends State<QuemSomos> {
  final bool isLogged =
      FirebaseAuth.instance.currentUser == null ? false : true;
  @override
  Widget build(BuildContext context) {
    return PageView(children: [
      Scaffold(
        drawer: const NavigationDrawer(),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.black, size: 30),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Quem somos?',
              style: Themes.latoRegular(20).copyWith(color: Colors.black),
            ),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          margin: const EdgeInsets.only(
            bottom: 22,
          ),
          padding: const EdgeInsets.all(10.0),
          child: ListView(children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
                child: Image.asset(
                  'imagens/quem_somos.png',
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
            Padding(
              //falta centralizar
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                style: Themes.latoLight(20),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
              child: Text(
                "Entre em contato!",
                style: Themes.latoBold(24),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconBottomCard(
                    colorCard: const Color(0xFF92E3A9),
                    icon: Icons.whatsapp,
                    ontap: () {
                      launchExternalWebsite(
                          'https://wa.me/5587991592631?text=Falae+pc+lind%C3%A3o');
                    },
                  ),
                  IconBottomCard(
                    colorCard: const Color(0xFFF99C66),
                    icon: Icons.phone,
                    ontap: () {
                      launchNuceuPhone();
                    },
                  ),
                  IconBottomCard(
                    colorCard: const Color(0xFF82BCD7),
                    icon: FontAwesomeIcons.instagram,
                    ontap: () {
                      launchExternalWebsite(
                          'https://www.instagram.com/nuceu_univasf/');
                    },
                  )
                ],
              ),
            ),
          ]),
        ),
        extendBody: true,
        bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: Color(0xFF636161),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: Color(0xFFD9D9D9),
                  ),
                  Padding(padding: EdgeInsets.only(right: 15)),
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: Color(0xFFD9D9D9),
                  ),
                ])),
      ),

      //A OUTRA PÁGINAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
      Scaffold(
        drawer: const NavigationDrawer(),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.black, size: 30),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Onde estamos?',
              style: Themes.latoRegular(20).copyWith(color: Colors.black),
            ),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          margin: const EdgeInsets.only(
            bottom: 22,
          ),
          padding: const EdgeInsets.all(10.0),
          child: ListView(children: [
            Column(children: [
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
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                child: Row(children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, right: 0, top: 10, bottom: 0),
                    child: Text(
                      "Visite nosso endereço: ",
                      style: Themes.latoRegular(24),
                    ),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 10, top: 20, bottom: 0),
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFF92E3A9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            FontAwesome5.map_marker_alt,
                            color: Color(0xFF263238),
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      launchExternalWebsite(
                          'https://goo.gl/maps/QgKb8rHiKJUsLi4eA');
                    },
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectelit, sed do eiusmod tempor incididunt ut lablit, sed do eiusmod tempor incididunt ut lablit, sed do eiusmod tempor incididunt ut lablit, sed do eiusmod tempor incididunt ut lablit, sed do eiusmod tempor incididunt ut lablit, sed do eiusmod tempor incididunt ut lablit, sed do eiusmod tempor incididunt ut lablit, sed do eiusmod tempor incididunt ut lablit, sed do eiusmod tempor incididunt ut lablit, sed do eiusmod tempor incididunt ut lablit, sed do eiusmod tempor incididunt ut labtur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: Themes.latoLight(20),
                  textAlign: TextAlign.justify,
                ),
              ),
            ]),
          ]),
        ),
        extendBody: true,
        bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: Color(0xFFD9D9D9),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: Color(0xFF636161),
                  ),
                  Padding(padding: EdgeInsets.only(right: 15)),
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: Color(0xFFD9D9D9),
                  )
                ])),
      ),
    ]);
  }

  void launchExternalWebsite(String url) async {
    var urlUri = Uri.parse(url);
    if (await canLaunchUrl(urlUri)) {
      await launchUrl(urlUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $urlUri';
    }
  }

  void launchNuceuPhone() async {
    var telUri = Uri(scheme: 'tel', path: "087991592631");
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    } else {
      throw 'Could not launch $telUri';
    }
  }
}
