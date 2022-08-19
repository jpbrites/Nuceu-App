// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'addEventoPopup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: const Center(
              child: Text(
                'Plantão Psicológico',
                style: TextStyle(fontFamily: 'Lato-Light', color: Colors.black),
              ),
            )),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            ButtonTheme(
              minWidth: 248.0,
              height: 224.0,
              child: RaisedButton(
                color: Colors.grey[400],
                onPressed: () {},
                child: Text(
                  "+",
                  style: const TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Campus Petrolina - 10 Julho',
              style: TextStyle(
                  fontFamily: 'Lato-Thin', fontSize: 24.0, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Text(
                'Campus Petrolina - 10 Julho do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(
                    fontFamily: 'Lato-Regular',
                    fontSize: 12.0,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AddNovoEvento(),
          ],
        ),
      ),
    );
  }
}

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


