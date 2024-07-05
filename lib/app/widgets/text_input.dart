import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelTxt;
  final bool isEmail;

  const TextInput({
    super.key,
    required this.labelTxt,
    this.isEmail = true,
  });

  @override
  Widget build(BuildContext context) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira um ${isEmail ? "email" : "nome"}';
          } else if (isEmail && !emailRegExp.hasMatch(value)) {
            return 'Por favor, insira um email válido';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: labelTxt,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ), 
    );
  }
}
