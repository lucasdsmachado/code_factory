import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String text;

  const Categories({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.fromLTRB(11, 4, 11, 4),
      decoration: BoxDecoration(
          color: const Color(0xFF65AAEA),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 12,
            fontVariations: [FontVariation("wght", 500)],
            color: Colors.white),
      ),
    );
  }
}
