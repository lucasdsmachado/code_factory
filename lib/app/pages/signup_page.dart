import 'package:code_factory/app/pages/account_pages.dart';
import 'package:code_factory/app/widgets/others/header.dart';
import 'package:code_factory/app/widgets/fields/password_input.dart';
import 'package:code_factory/app/widgets/fields/text_input.dart';
import 'package:code_factory/app/widgets/buttons/generic_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _registerUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        String uid = userCredential.user!.uid;

        await FirebaseDatabase.instance.ref().child('users/$uid').set({
          'name': _nameController.text,
          'email': _emailController.text,
          'savedCourses': {},
          'paymentMethods': {}
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Conta criada com sucesso!'),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AccountPages(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('A senha é muito fraca.'),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('O email já está em uso.'),
              
            ),
          );

          
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao criar conta.'),
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              headerTitle: '',
              navigationFunction: () {
                Navigator.pop(context);
              },
            ),
            Center(
              child: Image.asset(
                "assets/images/signup_image.png",
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
                    labelTxt: "Nome",
                    isEmail: false,
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextInput(
                    labelTxt: "Email",
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PasswordInput(controller: _passwordController),
                  const SizedBox(
                    height: 30,
                  ),
                  GenericButton(
                    buttonText: _isLoading ? "Aguarde..." : "Registre-se",
                    onPressedFunction:
                        _isLoading ? () {} : () => _registerUser(context),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
