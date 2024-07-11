import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String headerTitle;
  final VoidCallback navigationFunction;

  const Header({
    super.key,
    required this.headerTitle,
    required this.navigationFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: IconButton(
                onPressed: navigationFunction,
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                headerTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontVariations: [FontVariation('wght', 500)],
                ),
              ),
            ),
          ),
          // Placeholder for alignment
          Container(width: 40), // Adjust width to match icon container
        ],
      ),
    );
  }
}
