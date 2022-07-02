import 'package:flutter/material.dart';
import 'package:nuceu/widgets/home/cardhome.dart';
import 'package:nuceu/widgets/home/pesquisa.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double slideValue = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF535353),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 65,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Imagens
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            'imagens/nuceu.png',
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Image.asset(
                              'imagens/univasf.png',
                              width: MediaQuery.of(context).size.width * 0.20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Texto do nome do nuceu
                    const Text(
                      'Núcleo de Cuidado ao Estudante Universitário',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                      ),
                    ),
                    // botão de pesquisa
                    Pesquisa(),
                    // Texto pergunta como a pessoa está
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Olá,',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            'Como você está se sentindo hoje?',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontSize: 24,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //slider
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.71,
                      child: Slider(
                        value: slideValue,
                        onChanged: (double value) {
                          setState(() {
                            slideValue = value;
                          });
                        },
                        min: 0,
                        max: 10,
                      ),
                    ),
                    // Botao liga para a gente
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Liga para a gente!',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                wordSpacing: 2.6,
                                letterSpacing: 1,
                              ),
                            ),
                            Icon(
                              Icons.perm_phone_msg_outlined,
                              color: Color(0xFF92E3A9),
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //carrosel
            Expanded(
              flex: 2,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  CardHome(
                    textoCard: 'Conversar',
                    iconCard: Icons.more_horiz_rounded,
                  ),
                  CardHome(
                    textoCard: 'Videos',
                    iconCard: Icons.play_circle_outlined,
                  ),
                  CardHome(
                    textoCard: 'Gráfico',
                    iconCard: Icons.timeline,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
