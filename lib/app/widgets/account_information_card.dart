import 'package:flutter/material.dart';

class AccountInformationCard extends StatelessWidget {
  final String cardTitle;
  final String cardSubtitle;
  final IconData cardIcon; // Corrigido para IconData

  const AccountInformationCard({
    super.key,
    required this.cardTitle,
    required this.cardIcon,
    required this.cardSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: ListTile(
            leading: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  cardIcon,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
            title: Text(
              cardTitle,
              style: const TextStyle(
                fontVariations: [FontVariation('wght', 500)],
                fontSize: 20,
              ),
            ),
            subtitle: Text(cardSubtitle),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}