import 'package:code_factory/app/pages/account_pages.dart';
import 'package:code_factory/app/pages/signup_page.dart';
import 'package:code_factory/app/widgets/password_input.dart';
import 'package:code_factory/app/widgets/text_input.dart';
import 'package:code_factory/app/widgets/generic_button.dart';
import 'package:flutter/material.dart';

// TODO: Validar fomulário
// TODO: Rotas

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Obter a largura e a altura da tela

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Image.asset(
              "assets/images/login_image.png",
              // width: screenWidth * 0.70,
              height: MediaQuery.of(context).size.height * 0.40,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                const TextInput(labelTxt: "Email"),
                const SizedBox(
                  height: 15,
                ),
                const PasswordInput(isSignUp: false),
                const SizedBox(
                  height: 60,
                ),
                GenericButton(
                  buttonText: "Log in",
                  onPressedFunction: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountPages(), // TODO: validar login
                        ),
                      );
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  SignupPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Registrar",
                    style: TextStyle(
                      color: Colors.black45,
                      fontVariations: [FontVariation("wght", 500)],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
