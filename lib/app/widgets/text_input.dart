import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelTxt;

  const TextInput({
    super.key,
    required this.labelTxt,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: TextFormField(
        decoration: InputDecoration(
            labelText: labelTxt,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
      ), // TODO: botão de Ver senha
    );
  }
}
