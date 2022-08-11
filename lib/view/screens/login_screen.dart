import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/view/screens/forgot_password_screen.dart';
import 'package:nuceu/view/screens/home_screen.dart';
import 'package:nuceu/view/widgets/Login_screen_widgets/login_colored_button.dart';
import 'package:nuceu/view/widgets/Login_screen_widgets/login_textfield.dart';
import 'package:nuceu/view/widgets/navigation_drawer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const NavigationDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Entrar',
              style: Themes.latoRegular(48),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Email',
                style: Themes.latoRegular(20),
              ),
            ),
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
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Senha',
                style: Themes.latoRegular(20),
              ),
            ),
            LoginTextField(
              keyboardType: TextInputType.text,
              textController: passwordController,
              obscureText: true,
              validator: (_) {
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  //Detectar toque no esqueceu a senha sem quebrar a formatação
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassScreen(),
                        ));
                  },
                  child: Text(
                    'Esqueceu a Senha?',
                    textAlign: TextAlign.end,
                    style: Themes.latoRegular(14).copyWith(
                      shadows: const [
                        Shadow(color: Color(0xFF348BAA), offset: Offset(0, -4))
                      ],
                      decorationColor: const Color(0xFF348BAA),
                      decoration: TextDecoration.underline,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            LoginColoredButon(
              onTap: () {
                signIn();
              },
              color: const Color(0xFF348BAA),
              label: 'Entrar',
              textColor: Colors.white,
              google: false,
            ),
            const SizedBox(
              height: 30,
            ),
            LoginColoredButon(
              onTap: () {},
              color: Colors.white,
              label: 'Entrar com o Google',
              textColor: Colors.black,
              google: true,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) {
        Navigator.pop(context); // tira animação circular
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.pop(context); // tirar animação circular
      FocusManager.instance.primaryFocus
          ?.unfocus(); // Tirar teclado pra não atrapalhar a mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Falha ao realizar login. Verifique se seu email e senha estão corretos',
          style: Themes.latoRegular(20),
        ),
        backgroundColor: Colors.pinkAccent,
        duration: const Duration(seconds: 5),
      ));
    }
  }
}
