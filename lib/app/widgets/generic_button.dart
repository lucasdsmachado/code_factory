import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressedFunction;

  const GenericButton({
    super.key,
    required this.buttonText,
    required this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressedFunction,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            const Color(0xFFE3562A),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontVariations: [FontVariation("wght", 500)]),
        ),
      ),
    );
  }
}
