import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressedFunction;

  const ProfileButton({
    super.key,
    required this.buttonText,
    required this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressedFunction,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
              Theme.of(context).scaffoldBackgroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: Theme.of(context).dividerColor, // Cor da borda
                width: 1.0, // Largura da borda
              ),
            ),
          ),
          elevation: WidgetStateProperty.all<double>(0),
        ),
        child: Text(
          buttonText,
          style:  TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 24,
            fontVariations: const [FontVariation('wght', 500)],
          ),
        ),
      ),
    );
  }
}
