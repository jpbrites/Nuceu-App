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
  final EmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      drawer: const NavigationDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        backgroundColor: Colors.white,
        title: Text('Cadastrar',
            style: Themes.latoRegular(20).copyWith(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'imagens/register.png',
                    height: 300,
                  ),
                ],
              ),
              LoginTextField(
                keyboardType: TextInputType.emailAddress,
                textController: EmailController,
                obscureText: false,
                validator: (email) {
                  if (email != null && !EmailValidator.validate(email)) {
                    return 'Insira um email válido';
                  } else {
                    return null;
                  }
                },
                hintText: 'Email',
                icon: const Icon(
                  Typicons.at,
                  size: 26,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              LoginColoredButon(
                onTap: () {
                  registerUser();
                },
                color: const Color(0xFF109636),
                label: 'Criar conta',
                textColor: Colors.white,
                google: false,
              ),
            ],
          ),
        ),
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
        email: EmailController.text,
        password: '654321',
      );
      FocusManager.instance.primaryFocus?.unfocus();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Conta criada, senha padrão: 654321',
          style: Themes.latoRegular(20).copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 20, 180, 65),
        duration: const Duration(seconds: 5),
      ));
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
