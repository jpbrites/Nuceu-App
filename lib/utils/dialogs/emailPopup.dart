import 'package:flutter/material.dart';

class EmailPopup extends StatelessWidget {
  const EmailPopup({Key? key}) : super(key: key);

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
          title: const Text(
            'Informe seu email',
            style: TextStyle(
              fontFamily: 'Lato-Regular',
              fontSize: 16.0,
            ),
          ),
          content: const TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'email',
            ),
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


