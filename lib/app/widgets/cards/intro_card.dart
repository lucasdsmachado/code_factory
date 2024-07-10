import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double marginTop;

  const CardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.marginTop,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]); //  tela fixa no modo retrato

    
    return Column(
      children: [
        SizedBox(
          height: marginTop,
        ),
        Image.asset(
          imagePath,
          width: MediaQuery.of(context).size.width * 0.8,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
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
