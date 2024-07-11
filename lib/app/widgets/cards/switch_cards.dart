import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:code_factory/app/controller/theme_provider.dart';

class SwitchCards extends StatelessWidget {
  final String cardTitle;
  final IconData cardIcon;
  final Color trackColor;
  final bool haveToggleTheme;

  const SwitchCards({
    super.key,
    required this.cardTitle,
    required this.cardIcon,
    required this.trackColor,
    this.haveToggleTheme = false,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool switchValue = haveToggleTheme 
        ? themeProvider.isDarkTheme 
        : themeProvider.notificationsEnabled;

    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor, width: 1),
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
            trailing: Switch(
              value: switchValue,
              activeTrackColor: trackColor,
              thumbColor: const WidgetStatePropertyAll<Color>(Colors.black),
              onChanged: (bool value) {
                if (haveToggleTheme) {
                  themeProvider.toggleTheme();
                } else {
                  themeProvider.toggleNotifications();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
