import 'package:flutter/material.dart';

class AddNovoEvento extends StatelessWidget {
  const AddNovoEvento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
      ),
      onPressed: () => showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Informações do evento',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lato-Regular',
              fontSize: 16.0,
            ),
          ),
          content: Column(
            children: <Widget>[
              Text(
                  'Informe o Titulo do Evento',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Lato-Regular',
                    fontSize: 16.0,
                  )),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Titulo',
                ),
                style: TextStyle(height: 1.0),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Breve Descrição do Evento',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Lato-Regular',
                    fontSize: 16.0,
                  )),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descrição',
                ),
                style: TextStyle(height: 4.0),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Insira uma Imagem',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Lato-Regular',
                    fontSize: 16.0,
                  )),
              ButtonTheme(
                minWidth: 230.0,
                height: 180.0,
                child: RaisedButton(
                  color: Colors.grey[400],
                  onPressed: () {},
                  child: Text(
                    "+",
                    style: const TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancelar'),
              child: const Text('Cancelar',
                  style: TextStyle(
                    color: Colors.green,
                  )),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK',
                  style: TextStyle(
                    color: Colors.green,
                  )),
            ),
          ],
        ),
      ),
      child: const Text('Tenho Interesse'),
    );
  }
}
