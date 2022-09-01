import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nuceu/models/event_model.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/view/widgets/colored_button.dart';

import '../widgets/navigation_drawer.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

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
          'Informações sobre o evento',
          style: Themes.latoRegular(24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Informe o Titulo do Evento',
                textAlign: TextAlign.left,
                style: Themes.latoRegular(16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Titulo',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(height: 1.0),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Breve Descrição do Evento',
                textAlign: TextAlign.left,
                style: Themes.latoRegular(16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 150,
                  child: TextField(
                    //obscureText: true,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Descrição',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Insira uma Imagem',
                textAlign: TextAlign.left,
                style: Themes.latoRegular(16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      minWidth: 225.0,
                      height: 225.0,
                      child: RaisedButton(
                        color: Colors.grey[400],
                        onPressed: () {},
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColoredButton(
                    text: 'Cancelar',
                    width: 120,
                    ontap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ColoredButton(
                    text: 'Ok',
                    width: 84,
                    ontap: () async {
                      DateTime? data = await showDatePicker(
                        context: context,
                        locale: const Locale('pt', 'BR'),
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2050),
                      );
                      if (data != null) {
                        final event = EventModel(
                          titulo: titleController.text,
                          textoInformativo: descriptionController.text,
                          data: data,
                        );
                        createEvent(event: event);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createEvent({required EventModel event}) async {
    try {
      await FirebaseFirestore.instance
          .collection('eventos')
          .add(event.toJson())
          .then((value) async {
        await value.update({'id': value.id});
      });
      Navigator.pushNamedAndRemoveUntil(
          context, '/home-screen', (route) => false);
    } catch (e) {
      print(e);
    }
  }
}
