// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/utils/dialogs/interest_signal.dart';
import 'package:nuceu/utils/dialogs/interested_dialog.dart';
import 'package:nuceu/view/widgets/navigation_drawer.dart';
import '../../utils/dialogs/addEventoPopup.dart';

class EditPostScreen extends StatelessWidget {
  bool isLogged;
  String id;
  String photoUrl;
  String date;
  String title;
  String description;
  List<dynamic> emailsCadastrados;

  EditPostScreen({
    Key? key,
    this.id = '',
    this.photoUrl = '',
    this.date = '',
    this.title = '',
    this.description = '',
    this.isLogged = false,
    this.emailsCadastrados = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const NavigationDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black, size: 30),
          backgroundColor: Colors.white,
          title: Text(title,
              style: Themes.latoRegular(20).copyWith(color: Colors.black))),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            if (photoUrl != '')
              Image.network(
                photoUrl,
                width: 248,
                height: 224,
              ),
            /* ButtonTheme(
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
              ), */
            const SizedBox(
              height: 30,
            ),
            Text(
              date,
              style: TextStyle(
                  fontFamily: 'Lato-Thin', fontSize: 24.0, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Text(
                description,
                style: TextStyle(
                    fontFamily: 'Lato-Regular',
                    fontSize: 12.0,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            isLogged == true
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      interestedDialog(
                          context: context, emails: emailsCadastrados);
                    },
                    child: const Text('Ver interessados'),
                  )
                : InterestSignal(id: id)
          ],
        ),
      ),
    );
  }
}
