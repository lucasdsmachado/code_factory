import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const CardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: 264,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontVariations: [
                    FontVariation("wght", 500),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontVariations: [
                    FontVariation("wght", 400),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
