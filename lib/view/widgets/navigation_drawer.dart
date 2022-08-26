import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/utils/dialogs/addEventoPopup.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  final bool isLogged =
      FirebaseAuth.instance.currentUser == null ? false : true;

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
                    Icons.home,
                  ),
                  title: Text(
                    'Tela inicial',
                    style: Themes.latoLight(17),
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/'),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.play_circle,
                ),
                title: Text(
                  'Videos informativos',
                  style: Themes.latoLight(17),
                ),
                onTap: () => Navigator.of(context).pushNamed('/videos-screen'),
              ),
              if (!isLogged)
                ListTile(
                  leading: const Icon(
                    Icons.login,
                  ),
                  title: Text(
                    'Realizar login',
                    style: Themes.latoLight(17),
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/login-screen'),
                ),
              if (isLogged)
                ListTile(
                  leading: const Icon(
                    Icons.library_add,
                  ),
                  title: Text(
                    'Adicionar evento',
                    style: Themes.latoLight(17),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/edit-post-screen');
                  },
                ),
              if (isLogged)
                ListTile(
                  leading: const Icon(
                    Icons.person_add
                  ),
                  title: Text(
                    'Criar uma conta',
                    style: Themes.latoLight(17),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/create-account-screen');
                  },
              ),
              if (isLogged)
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                  ),
                  title: Text(
                    'Sair da conta',
                    style: Themes.latoLight(17),
                  ),
                  onTap: () {
                    FirebaseAuth.instance
                        .signOut()
                        .then((value) => {Navigator.pushNamed(context, '/')});
                  },
                ),
            ],
          ),
        ),
      );
}
