import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: ListTile(
                  leading: const Icon(
                    Icons.login,
                  ),
                  title: Text(
                    'Realizar login',
                    style: Themes.latoLight(17),
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/login-screen'),
                ),
              )
            ],
          ),
        ),
      );
}
