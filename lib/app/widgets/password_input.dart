import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

bool _hidePassword = true;

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: TextFormField(
        // ignore: prefer_const_constructors
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
      ), // TODO: botão de Ver senha
    );
  }
}
