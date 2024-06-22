import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String labelTxt;

  const FormInput(
      {super.key, required this.labelTxt,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: TextFormField(
        decoration: InputDecoration(
            labelText: labelTxt,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
        obscureText: true,
      ), // TODO: botão de Ver senha
    );
  }
}
