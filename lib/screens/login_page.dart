import 'package:flutter/material.dart';

// TODO: Estilizar a página
// TODO: Validar  fomulário
// TODO: Rotas


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obter a largura e a altura da tela
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Image.asset(
              "assets/login_image.png",
              // width: screenWidth * 0.70,
              height: screenHeight * 0.40,
            ),
          ),
          Form(
              child: Column(
            children: [
              SizedBox(
                width: screenWidth * 0.90,
                child: const TextField(),
              ),
              SizedBox(
                width: screenWidth * 0.90,
                child: const TextField(),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Log in")),
              TextButton(onPressed: () {}, child: const Text("Registre-se"))
            ],
          ))
        ],
      ),
    );
  }
}
