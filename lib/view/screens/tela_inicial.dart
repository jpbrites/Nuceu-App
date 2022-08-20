import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:flutter/services.dart';
import 'package:nuceu/view/screens/home_screen.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicio createState() => _TelaInicio();
}
  class _TelaInicio extends State<TelaInicial> {

  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: 
          Center(
            child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 320, bottom: 0),
                      child:
                      Image.asset(
                      'imagens/logo_nuceu.png',
                      width: 173.0,
                      height: 61.0,
                      alignment: Alignment.bottomLeft
                    
                  ),
                    ),
                    Text(
                      "Núcleo de Cuidado ao Estudante Universitário",
                      style: Themes.latoLight(12),
                      textAlign: TextAlign.center,
            ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 310, bottom: 0),
                      child:
                      Image.asset(
                      'imagens/univasf.png',
                      width: 72.0,
                      height: 19.0,
                      alignment: Alignment.bottomLeft
                      
                    ),
                    ),
                    
                  ]
          ),
    ),
    );

  }

}