import 'package:flutter/material.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/view/widgets/Login_screen_widgets/login_colored_button.dart';
import 'package:nuceu/view/widgets/Login_screen_widgets/login_textfield.dart';

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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
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
              validator: (_) {
                return null;
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
            const SizedBox(
              height: 28,
            ),
            LoginColoredButon(
              onTap: () {},
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
}
