// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nuceu/view/widgets/navigation_drawer.dart';
import '../../utils/dialogs/addEventoPopup.dart';

class EditPostScreen extends StatelessWidget {
  const EditPostScreen({Key? key}) : super(key: key);

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
              'Plantão Psicológico',
              style: TextStyle(fontFamily: 'Lato-Light', color: Colors.black),
            )),
        body: SingleChildScrollView(
          child: Column(
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
      )
    ;
  }
}

