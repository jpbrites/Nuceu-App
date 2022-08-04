import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/view/widgets/Login_screen_widgets/login_textfield.dart';
import 'package:nuceu/view/widgets/Login_screen_widgets/login_colored_button.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            IconButton(
              iconSize: 32,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              splashRadius: 20,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios ,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Recuperação de Senha',
              style: Themes.latoRegular(48),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Email Cadastrado',
                style: Themes.latoRegular(20),
              ),
            ),
            LoginTextField(
              keyboardType: TextInputType.emailAddress,
              textController: emailController,
              obscureText: false,
              validator: (_) {
                return null;
              },
            ),
            const SizedBox(
              height: 28,
            ),
            LoginColoredButon(
              onTap: () {recoverEmail();},
              color: const Color(0xFF348BAA),
              label: 'Enviar email para recuperação',
              textColor: Colors.white,
              google: false,
            ),
          ],
        ),
      ),
    );
  }

  Future recoverEmail() async {
  showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context)=> const Center(child: CircularProgressIndicator()));
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.greenAccent,
        content: Text(
          'Email de redefinição enviado com sucesso',
          style: Themes.latoRegular(20),),
        duration: const Duration(seconds: 5,)
      ));
    Navigator.of(context).popUntil((route) => route.isFirst);
  } on FirebaseAuthException catch (e) {
    print(e);
    final String error;
    if(e.message.toString() == 'There is no user record corresponding to this identifier. The user may have been deleted.'){
        error = 'Não foi possível encontrar nenhum usuário cadastrado com esse Email';
      } else {
        error = 'Verifique-se que o email está escrito corretamente';
      }

    Navigator.pop(context); // Retirar a animação de Loading
    FocusManager.instance.primaryFocus?.unfocus(); // Tirar teclado pra não atrapalhar a mensagem de erro
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          error, 
          style: Themes.latoRegular(20),
          ),
        backgroundColor: Colors.pinkAccent,
        duration: const Duration(seconds: 5),
        )
      );
    }
  }
}