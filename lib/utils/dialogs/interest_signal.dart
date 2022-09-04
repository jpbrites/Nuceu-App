import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';

class InterestSignal extends StatefulWidget {
  String id;
  InterestSignal({Key? key, this.id = ''}) : super(key: key);

  @override
  State<InterestSignal> createState() => _InterestSignalState();
}

class _InterestSignalState extends State<InterestSignal> {
  late TextEditingController controller;

  @override
  void initState(){
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
      ),
      onPressed: (){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Informe seu email',
              style: Themes.latoRegular(20).copyWith(color: Colors.black),
            ),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              child: Column(
                children: <Widget>[
                  const Text(
                    '(Isto é apenas uma sinalização de interesse, possíveis cadastros adicionais podem ser requeridos posteriormente)',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Lato-Regular',
                      fontSize: 16.0,
                    )),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: controller,
                    autofocus: true,
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Seu Email'
                  ),
                  style: const TextStyle(height: 1.0),
                ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: submit, 
                child: const Text('Submeter')
              ),
            ],
          ),
        );
      }, 
      child: const Text('Tenho Interesse'),
    );
  }

  void submit(){
    Navigator.of(context).pop();
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(controller.text);
    emailValid == true ? sendFirebase() : failEmail('Email inválido, por favor tentar novamente');
  }

  Future<void> sendFirebase() async {
    try {
      await FirebaseFirestore.instance
        .collection('eventos')
        .doc(widget.id)
        .update({"emailsCadastrados" : FieldValue.arrayUnion([controller.text])});
      sucessEmail();
    } catch (e) {
      print(e);
      failEmail('Falha ao enviar seu email, favor tentar novamente');
    }
  }

  void failEmail(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          duration: const Duration(seconds: 5,)));
  }

  void sucessEmail(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.greenAccent,
          content: Text(
            'Interesse sinalizado com sucesso',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          duration: Duration(seconds: 5,)));
  }
}