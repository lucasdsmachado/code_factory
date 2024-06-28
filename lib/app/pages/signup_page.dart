import 'package:code_factory/app/pages/login_page.dart';
import 'package:code_factory/app/widgets/password_input.dart';
import 'package:code_factory/app/widgets/text_input.dart';
import 'package:code_factory/app/widgets/generic_button.dart';
import 'package:flutter/material.dart';

// TODO: Estilizar a página
// TODO: Validar  fomulário
// TODO: Rotas

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
              "assets/images/signup_image.png",
              // width: screenWidth * 0.70,
              height: MediaQuery.of(context).size.height * 0.40,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Form(
              child: Column(
            children: [
              const TextInput(labelTxt: "Nome"),
              const SizedBox(
                height: 15,
              ),
              const TextInput(labelTxt: "Email"),
              const SizedBox(
                height: 15,
              ),
              const PasswordInput(),
              const SizedBox(
                height: 30,
              ),
              GenericButton(
                buttonText: "Registre-se",
                onPressedFunction: () {
                  // TODO: adicionar outras funcionalidades
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
