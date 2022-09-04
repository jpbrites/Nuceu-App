// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nuceu/utils/dialogs/interest_signal.dart';
import 'package:nuceu/view/widgets/navigation_drawer.dart';
import '../../utils/dialogs/addEventoPopup.dart';

class EditPostScreen extends StatelessWidget {
  bool isLogged;
  String id;
  String photoUrl;
  String date;
  String title;
  String description;

  EditPostScreen({Key? key,  
  this.id = '', 
  this.photoUrl = '', 
  this.date = '',
  this.title = '',
  this.description = '',
  this.isLogged = false
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
            title: Text(
              title,
              style: TextStyle(fontFamily: 'Lato-Light', color: Colors.black),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Image.network(photoUrl,
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
              isLogged == true ? SizedBox(height: 0, width: 0,) : InterestSignal(id: id)
            ],
          ),
        ),
      )
    ;
  }
}

