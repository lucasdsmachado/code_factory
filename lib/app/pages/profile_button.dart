import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressedFunction;
  const ProfileButton(
      {super.key, required this.buttonText, required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        child: ElevatedButton(
          onPressed: onPressedFunction,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              Colors.white,
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            elevation: WidgetStateProperty.all<double>(0),
            side: WidgetStateProperty.all<BorderSide>(
              const BorderSide(
                color: Colors.black38, // Cor da borda
                width: 1.0, // Largura da borda
              ),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 24,
              fontVariations: [FontVariation('wght', 500)],
            ),
          ),
        ));
  }
}
