import 'package:code_factory/app/pages/user_pages/account_pages.dart';
import 'package:code_factory/app/pages/login_signup/signup_page.dart';
import 'package:code_factory/app/utils/firebase_helper.dart';
import 'package:code_factory/app/widgets/fields/password_input.dart';
import 'package:code_factory/app/widgets/fields/text_input.dart';
import 'package:code_factory/app/widgets/buttons/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AccountPages(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        handleFirebaseException(context, e);
      } catch (e) {
        showErrorSnackBar(context, "Erro ao fazer login.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Obter a largura e a altura da tela

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  TextInput(
                    labelTxt: "Email",
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PasswordInput(
                    isSignUp: false,
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  GenericButton(
                    buttonText: "Log in",
                    onPressedFunction: () {
                      _loginUser(context);
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Registrar",
                      style: TextStyle(
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
      ),
    );
  }
}
