import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/view/widgets/Login_screen_widgets/login_colored_button.dart';
import 'package:nuceu/view/widgets/Login_screen_widgets/login_textfield.dart';
import 'package:nuceu/view/widgets/navigation_drawer.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final emailController = TextEditingController();

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
            title: const Text(
              'Crie um usuário',
              style: TextStyle(fontFamily: 'Lato-Light', color: Colors.black),
            )),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            LoginTextField(
              keyboardType: TextInputType.emailAddress,
              textController: emailController,
              obscureText: false,
              validator: (email) {
                if (email != null && !EmailValidator.validate(email)) {
                  return 'Insira um email válido';
                } else {
                  return null;
                }
              },
              hintText: 'Email', 
              icon: const Icon(Typicons.at, size: 26,),
            ),
            SizedBox(
              height: 30,
            ),
              LoginColoredButon(
              onTap: () {
                registerUser();
              },
              color: const Color(0xFF348BAA),
              label: 'Criar conta',
              textColor: Colors.white,
              google: false,
            ),
          ],),
        ),
        );
  }

  Future registerUser() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: '654321',
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.pop(context); // tirar animação circular
      FocusManager.instance.primaryFocus
          ?.unfocus(); // Tirar teclado pra não atrapalhar a mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Falha ao criar a conta.',
          style: Themes.latoRegular(20),
        ),
        backgroundColor: Colors.pinkAccent,
        duration: const Duration(seconds: 5),
      ));
    }
    Navigator.pop(context); 
  }
}