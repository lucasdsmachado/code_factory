import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final bool isSignUp;

  const PasswordInput({super.key, this.isSignUp = true});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

bool _hidePassword = true;
final RegExp _passwordRegExp = RegExp(
  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,24}$',
);

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira uma senha';
          } else if (widget.isSignUp && !_passwordRegExp.hasMatch(value)) {
            return 'A senha deve ter entre 8 e 24 caracteres, incluir pelo menos uma letra maiúscula, uma letra minúscula e um caractere especial';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Senha",
          suffixIcon: IconButton(
            icon: Icon(
              _hidePassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        obscureText: _hidePassword,
      ), 
    );
  }
}
