import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String text;

  const Categories({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double margin = MediaQuery.of(context).size.width * 0.02; // TODO: AJUSTAR 

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: margin),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF65AAEA),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(11, 4, 11, 4),
          child: Text(
            "#$text",
            style: const TextStyle(
                fontSize: 12,
                fontVariations: [FontVariation("wght", 500)],
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
